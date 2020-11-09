trigger AccountDeletion on Account (before delete) {

    for (Account a : [SELECT id FROM Account
                        WHERE Id IN (SELECT AccountId FROM Opportunity) And 
                        Id IN :Trigger.old ]){

                            Trigger.oldMap.get(a.Id).addError(
                                'Cannot delete account with  related opportunities.');
                        }

}