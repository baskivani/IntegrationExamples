public class MyIntegrationClass {
    
    public static final string myToken ='Bearer 21e4ff1d98cd4bf8a4e682ddaacb0902bc23a63a8882829209d7f558d9e4e115';
    public static final string  API_ENDPOINT='https://gorest.co.in/public/v2/users/';
    
public static void PUTMethoduTekRecordUpdateEt(String MusteriId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PUT');
        request.setEndpoint(API_ENDPOINT+MusteriId);
        request.setHeader('Authorization',myToken);
        request.setBody('{"name":"Ahmet Aslan","email":"heyder@gmail.com","gender":"male","status":"inactive"}');
        request.setHeader('Content-Type','application/Json;charset=UTF-8');
        HttpResponse response = http.send(request);
        
                
         if (response.getStatusCode()==200){
            system.debug('The process is succesfull');
            system.debug(response.getStatusCode());
            system.debug(response.getBody()); 
        } else {
            system.debug(response.getStatusCode()+'error');
        }
    }
}