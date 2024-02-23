
public class MyIntegrationClass {
    
    public static final string myToken ='Bearer 21e4ff1d98cd4bf8a4e682ddaacb0902bc23a63a8882829209d7f558d9e4e115';
    public static final string  API_ENDPOINT='https://gorest.co.in/public/v2/users/';
    

public static void TekRecorduMusteridenAlPostMethoduileKarsiyaKaydet(String musteriId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(API_ENDPOINT);
        request.setHeader('Authorization',myToken);
        
        request.setHeader('Content-Type','application/Json;charset=UTF-8');
        
        Musteri__c gonderilecekMusteri = [SELECT Id, Name, gender__c, email__c, status__c FROM Musteri__c Where id=: musteriId];
        
        MusteriContainer newRecord = new MusteriContainer();
        newRecord.name= gonderilecekMusteri.name;
        newRecord.email = gonderilecekMusteri.email__c;
        newRecord.Gender = gonderilecekMusteri.gender__c;
        newRecord.status	= gonderilecekMusteri.status__c;
        
        
        String payload = JSON.serialize(newRecord);
        request.setBody(payload);
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode()==201){
            
            system.debug('The process is succesfull');
            system.debug(response.getStatusCode());
            system.debug(response.getBody()); 
        } else {
            system.debug(response.getStatusCode()+'error');
        }
    }
}