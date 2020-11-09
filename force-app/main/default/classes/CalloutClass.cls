public with sharing class CalloutClass {

    @future(callout = true)
    public static void makeCallout(){
        HttpRequest request = new HttpRequest(); 
        
        request.setEndpoint('http://yourHost/yourService');

        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
    }
    
}