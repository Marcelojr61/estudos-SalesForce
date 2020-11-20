public with sharing class AccountUtility {
    
    
    public static void viewAnnualRevenue() {

        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account WITH SECURITY_ENFORCED];

        for (Account acc : accountsList) {
            String acctRev = 'account name: ' + acc.Name + ' annual revenue: ' + acc.AnnualRevenue;
            System.debug(acctRev);             
        }

    }
}
