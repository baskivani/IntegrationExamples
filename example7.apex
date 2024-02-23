public class MyIntegrationClass {
    
    public static final string myToken ='Bearer 21e4ff1d98cd4bf8a4e682ddaacb0902bc23a63a8882829209d7f558d9e4e115';
    public static final string  API_ENDPOINT='https://gorest.co.in/public/v2/users/';
    

 public static void POSTMethoduFromMusteri(String Name){
        
        String musteriName=Name +'%';
        List<Musteri__c> mstList = [SELECT Id, Name, email__c, gender__c, status__c FROM Musteri__c Where Name Like:musteriName];
        List<MusteriContainer> gidecekMList = new List<MusteriContainer>();
        
        for (Musteri__c mst : mstList){
            MusteriContainer musRecord = new MusteriContainer();
            musRecord.name=mst.name;
            musRecord.email=mst.email__c;
            musRecord.status=mst.status__c;
            musRecord.gender=mst.gender__c;
            gidecekMList.add(musRecord);
        }
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(API_ENDPOINT);
        request.setHeader('Authorization',myToken);
        String payload =Json.serialize(gidecekMList); 
        request.setBody(payload);
        request.setHeader('Content-Type','application/Json;charset=UTF-8');
        HttpResponse response = http.send(request);
        
        
        if (response.getStatusCode()==201){
            system.debug('The process is succesfull');
            system.debug(response.getStatusCode());
            system.debug(response.getBody()); 
        } else {
            system.debug(response.getStatusCode()+'error');
        }
    }
    /***********************************************************************************/  
}