public class MyIntegrationClass {
    
    public static final string myToken ='Bearer 21e4ff1d98cd4bf8a4e682ddaacb0902bc23a63a8882829209d7f558d9e4e115';
    public static final string  API_ENDPOINT='https://gorest.co.in/public/v2/users/';
    

 public static void PUTMethoduCokluRecordlariUpdateEt(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('PUT');
        request.setEndpoint(API_ENDPOINT);
        request.setHeader('Authorization',myToken);
        request.setBody('["id": 5913666,"name": "Baris Talwar","email": "talwar@mann.test","gender": "female","status": "inactive"},{"id": 5913665,"name": "Karthika Menona","email": "memoli@gmail.com","gender": "female","status": "inactive"}]');
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