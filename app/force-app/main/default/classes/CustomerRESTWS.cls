@RestResource(urlMapping='/api1/Customer/*')
global with sharing class CustomerRESTWS {

    @HttpPost
    global static CreateCustomerRES createCustomer() {
        // Get the request body as a string
        String requestBody = RestContext.request.requestBody.toString();

        CreateCustomerRES resp = new CreateCustomerRES();
        try {
            // Deserialize the JSON request body into the request object
            CreateCustomerREQ cust = (CreateCustomerREQ) JSON.deserialize(requestBody, CreateCustomerREQ.class);

            // Create Account
            Account acc = new Account();
            acc.Name = cust.accountName;
            insert acc;

            // Create Contact
            Contact con = new Contact();
            con.FirstName = cust.contactFirstName;
            con.LastName = cust.contactLastName;
            con.Email = cust.contactEmail;
            con.AccountId = acc.Id;
            insert con;

            // Set response
            resp.accountId = acc.Id;
            resp.contactId = con.Id;
            resp.status = 'success';
        } catch(Exception e) {
            resp.status = 'failed';
            resp.errorMessage = e.getMessage();
        }
        return resp;
    }

    // Request DTO
    global class CreateCustomerREQ {
        global String accountName {get;set;}
        global String contactFirstName {get;set;}
        global String contactLastName {get;set;}
        global String contactEmail {get;set;}
    }

    // Response DTO
    global class CreateCustomerRES {
        global Id accountId {get;set;}
        global Id contactId {get;set;}
        global String status {get;set;}
        global String errorMessage {get;set;}
    }
}