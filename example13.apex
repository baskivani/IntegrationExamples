@RestResource(UrlMapping='/accounts/*')
global class AccountProvider {
   @httpGet
    global Static List<account> accountGonder(){
       List<account> accList = [SELECT id,Name , phone FROM account LIMIT 4]; 
        return accList;
    }
