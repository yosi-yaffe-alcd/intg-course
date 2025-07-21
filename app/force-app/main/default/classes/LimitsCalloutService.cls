public with sharing class LimitsCalloutService {
    
    public LimitsCalloutService() {}

    public void getSalesforceLimits() {
        // Named Credential URL: callout:IntegCourse/services/data/v59.0/limits
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:IntegCourse/data/v63.0/limits');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            System.debug(JSON.serializePretty(res.getBody()));
        } else {
            System.debug('Failed to retrieve limits. Status: ' + res.getStatus() + ', Body: ' + res.getBody());
        }
    }
}