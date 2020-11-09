public with sharing class AccountHandler {

    public static Account insertNewAccount(String name){
    
        Account account =  new Account(Name = name);
        Database.SaveResult result = Database.insert (account, false);

        if (result.isSuccess()){
            return account;
        }     

        return null;
    }
}