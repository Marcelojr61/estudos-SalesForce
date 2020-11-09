trigger AccountAddressTrigger on Account (before insert, before update) {

    for (Account a : Trigger.new) {

        if((a.BillingPostalCode != null) && (a.Match_Billing_Address__c == true) ){

            try {
                a.ShippingPostalCode=a.BillingPostalCode;
                if (a.Id == null){
                    insert a;
                }
                update a;
                }catch (Exception e) {
                    System.debug('Ocorreu a seguinte exceção:' + e.getMessage());
                }
                
        }
        
    }



}