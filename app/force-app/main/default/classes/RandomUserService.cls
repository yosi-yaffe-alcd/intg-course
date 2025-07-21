public with sharing class RandomUserService {

    public RandomUserRES getRandomUser() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:RandomUser/?results=1'); // Adjust the endpoint as needed
        HttpResponse response = http.send(request);
        System.debug('Response Status: ' + response.getStatus());
        System.debug('Response Body: ' + response.getBody());
        if (response.getStatusCode() == 200) {
            return (RandomUserRES) JSON.deserialize(response.getBody(), RandomUserRES.class);
        } else {
            throw new CalloutException('Failed to get random user: ' + response.getStatus());
        }    
    }

    //OBJECTS
    public class RandomUserRES{
        public List<RandomUser> results {get;set;}
    }
    
    public class RandomUser {
        public Name name {get;set;}
        public String email {get;set;}
        public String phone {get;set;}
        public Picture picture {get;set;}
    }

    public class Picture {
        public String large {get;set;}
    }

    public class Name {
        public String first {get;set;}
        public String last {get;set;}
    }
}