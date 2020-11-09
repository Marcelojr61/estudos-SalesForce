public with sharing class ContactSearch {
    
    public static List<Contact> searchForContacts(String lastName, String zipeCode) {

        Contact[] contacts = [SELECT Id,Name FROM Contact 
                    WHERE (LastName=: lastName AND MailingPostalCode=: zipeCode )];
        return contacts;

    }
}