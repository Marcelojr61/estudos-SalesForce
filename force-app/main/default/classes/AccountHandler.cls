public with sharing class AccountHandler {

    public static Account insertNewAccount(String name){
    
        Account account =  new Account(Name = name);
        Database.SaveResult result = Database.insert (account, false);

        if (result.isSuccess()){
            return account;
        }     

        return null;
    }

    public static void insertAccount(Integer numNewAcc){

        List<Account> addAccounts = new List<Account>();      
        Integer n = 0;

        while (n <= numNewAcc) {
            addAccounts.add( 
                new Account( 
                    Name = 'Acme Inc ' + n,
                    AccountNumber = 'A000' + n));
            n = n+1;            
        }

        insert addAccounts;

    }
}