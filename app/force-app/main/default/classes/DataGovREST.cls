public with sharing class DataGovREST {
    
    public DataGovREST() {}

    public GetFlightsRES getFlightInfo(Integer recordLimit) {
        //https://data.gov.il/dataset/flydata/resource/e83f763b-b7d7-479e-b172-ae981ddc6de5
        String resourceId = 'e83f763b-b7d7-479e-b172-ae981ddc6de5';
        String endpoint = String.format(
            'callout:DataGOV?resource_id={0}&limit={1}',
            new List<String>{resourceId, String.valueOf(recordLimit)}
        );

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        //req.setHeader('Content-Type', 'application/json');

        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            // Handle successful response
            System.debug('Response: ' + res.getBody());
            GetFlightsRES result = (GetFlightsRES) JSON.deserialize(res.getBody(), GetFlightsRES.class);
            System.debug(JSON.serializePretty(result));
            return result;
        } else {
            // Handle error
            System.debug('Error: ' + res.getStatusCode() + ' - ' + res.getBody());
            throw new CalloutException('Failed to retrieve flight data: ' + res.getStatusCode() + ' - ' + res.getBody());
        }
    }

    // OBJECTS
    public class GetFlightsRES {
        public String help;
        public Boolean success;
        public GetFlightsResult result;
    }

    public class GetFlightsResult {
        public Boolean include_total;
        public Integer recordLimit;
        public String records_format;
        public String resource_id;
        public Object total_estimation_threshold;
        public List<GetFlightsRecord> records;
        public List<GetFlightsField> fields;
        public GetFlightsLinks links;
        public Integer total;
        public Boolean total_was_estimated;
    }

    public class GetFlightsRecord {
        public Integer id;
        public String CHOPER;
        public String CHFLTN;
        public String CHOPERD;
        public String CHSTOL;
        public String CHPTOL;
        public String CHAORD;
        public String CHLOC1;
        public String CHLOC1D;
        public String CHLOC1TH;
        public String CHLOC1T;
        public String CHLOC1CH;
        public String CHLOCCT;
        public Integer CHTERM;
        public String CHCINT;
        public String CHCKZN;
        public String CHRMINE;
        public String CHRMINH;
    }

    public class GetFlightsField {
        public String id;
        public String type;
    }

    public class GetFlightsLinks {
        public String start;
        public String next;
    }
}