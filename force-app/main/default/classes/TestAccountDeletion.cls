@istest
public class TestAccountDeletion {
   
    @istest
    static void testDeleteAccountWithOneOpportunity(){
        //Arrange: 
        Account[] accounts = TesteDataFactory.createdAccountWithOpportunity(1,1);
        
        //Act:
        Test.startTest();
        Database.DeleteResult result = Database.delete(accounts[0], false);
        Test.stopTest();

        //Assert
        System.assert(!result.isSuccess(), 'Result must be Fail');
        System.assert(result.getErrors().size() > 0, 'Result must be Fail');
        System.assertEquals('Cannot delete account with related opportunities.',
                            result.getErrors()[0].getMessage(), 
                            'Message of Error must be "Cannot delete account with related opportunities."');
    }

    @istest
    static void testDeleteAccountWithNoOpportunities(){
        //Arrange: 
        Account[] accounts = TesteDataFactory.createdAccountWithOpportunity(1,0); 
        //Act:
        Test.startTest();
        Database.DeleteResult result = Database.delete(accounts[0], false);
        Test.stopTest();
        //Assert
        System.assert(result.isSuccess(), 'Result must be Success');
    }   

    @istest
    static void testDeleteAccountsWithOneOpportunity(){
        //Arrange
        Account[] accounts = TesteDataFactory.createdAccountWithOpportunity(200,1); 

        //Act
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accounts, false); 
        Test.stopTest();

        //assert
        for (Database.DeleteResult deleteRs : results) {
            System.assert(!deleteRs.isSuccess(), 'Result must be Fail');
            System.assert(deleteRs.getErrors().size() > 0, 'Result must be Fail');
            System.assertEquals('Cannot delete account with related opportunities.',
                                    deleteRs.getErrors()[0].getMessage(), 
                                    'Message of Error must be "Cannot delete account with related opportunities."');
        }
    }

    @istest
    static void testDeleteBulkAccountsWithNoOpportunity(){
        //Arrange
        Account[] accounts = TesteDataFactory.createdAccountWithOpportunity(200,0); 

        //Act
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accounts, false); 
        Test.stopTest();

        //assert
        for (Database.DeleteResult deleteRs : results) {
            System.assert(deleteRs.isSuccess(), 'Result must be Sucess');

        }
    

    }
}