({
    
    /**
     * Auto generate the username from firstName on tab
     */

    updateNickname : function(component, event, helper) {
        //Update the nickname field when 'tab' is pressed
        if(event.getParams().keyCode == 9){
            var nameInput = component.find("firstName");
            var nameValue = component.get("v.value");
            var nickname = component.find("nickname");
            var today = new Date();
            nickname.set("v.value", nameValue + today.valueOf(today));
        }
    },

    /**
     * Capture the Inputs and invoke the helper.save with the input params
     */

    saveUserForm : function(component, event, helper){
        var name = component.get("v.user.First");
        var last = component.get("v.user.Last");
        var password = component.get("v.user.Password__c");
        var email = component.get("v.user.Email__c");
        var nickname = component.get("v.user.Nickname");
        var passwordCpm = component.find("userPassword");
        var emailCpm = component.find("userEmail");
        helper.validatePassword(component, event, helper);
        helper.validateEmail(component, event, helper);
        if(passwordCpm.get("v.errors") == null && emailCpm.get("v.errors") == null){
            component.set("v.hasErrors", false);
            helper.save(component, name + " " + last, password, email, nickname);
        }else{
            component.set("v.hasErrors", true);
        }

    },

    cancel : function(component, event, helper){
        $A.get("e.force:closeQuickAction").fire();

    }


})
