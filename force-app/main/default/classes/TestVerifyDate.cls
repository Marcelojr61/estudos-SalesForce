@istest
public class TestVerifyDate {    
    
    @istest
    static void testCheckDatesShouldUseData2() {
        //Arrange:
        Date date1 = Date.valueOf('2013-08-01');
        Date date2 = Date.valueOf('2013-08-30');
        //Act:
        Date returnDate = VerifyDate.checkDates(date1, date2); 
        //Assert:
        System.assertEquals(date2, returnDate, 'Date must be equal date2');
    }

    @istest
    static void testCheckDatesShouldUseData1() {
        //Arrange:
        Date date1 = Date.valueOf('2013-09-01');
        Date date2 = Date.valueOf('2013-08-01');
        Date expected = Date.valueOf('2013-09-30');
        //Act:
        Date returnDate = VerifyDate.checkDates(date1, date2);  
        //Assert:      
        System.assertEquals(expected, returnDate, 'Date must be equal 2013-09-30');
    }
}