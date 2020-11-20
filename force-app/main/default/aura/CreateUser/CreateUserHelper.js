({
    save : function(component, name, password, email, nickname) {
        var userRecord = {apiName: 'Test_User__c', fields:{} }
        userRecord.fields.Name = {value: name};
        userRecord.fields.Password__c = {value: password};
        userRecord.fields.Email__c = {value: email};
        userRecord.fields.Nickname__c = {value: nickname};
        userRecord.fields.Case_Study__c = {value: component.get("v.recordId")}
        component.find("frd").set()


    }
})
