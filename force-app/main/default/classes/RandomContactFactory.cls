public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numCont, String lastName) {

        List<Contact> contacts = new List<Contact>();

        for (Integer i=0; i<numCont; i++){
            Contact c = new Contact(FirstName = 'Test' + i, LastName = lastName);
            contacts.add(c);             
        }
        return contacts;
    }
}
