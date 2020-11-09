@istest
public class TestRestrictContactByName {
    
    @istest
    static void restrictContactByNameWithNameNull() {
        //Arrange:
        Contact contact = new Contact(LastName = 'INVALIDNAME'); 
        //Act:
        Test.startTest();
        Database.SaveResult result = Database.insert(contact, false);
        Test.stopTest();
        //Assert
        System.assert(!result.isSuccess(), 'Result not must be is Sucess');
        System.assert(result.getErrors().size() > 0, 'Result not must be is Sucess');
        System.assertEquals('The Last Name "'+contact.LastName+'" is not allowed for DML', 
                                result.getErrors()[0].getMessage(), 
                                'The Last Name "'+contact.LastName+'" is not allowed for DML');

        

    }
}
