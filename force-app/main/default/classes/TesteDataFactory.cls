@istest
public class TesteDataFactory {

    public static List<Account> createdAccountWithOpportunity(Integer numAccts, Integer numOppsperAcct) {
        List<Account> accounts = new List<Account>();

        for (Integer i=0; i<numAccts; i++) {
            Account a = new Account(Name = 'TestAccount' + i);
            accounts.add(a);            
        }
        insert accounts;

        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0; j<numAccts; j++) {
            Account acct = accounts[j];

            for (Integer k=0; k<numOppsperAcct; k++) {
                opps.add(new Opportunity(

                    Name = acct.Name + 'Opportunity' + k,
                    StageName = 'Prospecting',
                    CloseDate = System.today().AddMonths(1),
                    AccountId = acct.Id
                ));
            }            
        }
        insert opps;

        return accounts;
    }
}