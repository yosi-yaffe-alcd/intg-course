global with sharing class CustomerWS {

    global CustomerWS(){}

    webservice static CreateCustomerRES createCustomer(CreateCustomerREQ cust){
        CreateCustomerRES resp = new CreateCustomerRES();
        try {
            Account acc = new Account();
            acc.Name = cust.accountName;
            insert acc;

            Contact con = new Contact();
            con.FirstName = cust.contactFirstName;
            con.LastName = cust.contactLastName;
            con.Email = cust.contactEmail;
            con.AccountId = acc.Id;
            insert con;

            resp.accountId = acc.Id;
            resp.contactId = con.Id;
            resp.status = 'success';
        } catch(Exception e) {
            resp.status = 'failed';
            resp.errorMessage = e.getMessage();
        }
        return resp;
    }

    //OBJECTS
    global class CreateCustomerREQ {
        webservice String accountName {get;set;}
        webservice String contactFirstName {get;set;}
        webservice String contactLastName {get;set;}
        webservice String contactEmail {get;set;}
    }

    global class CreateCustomerRES {
        webservice Id accountId {get;set;}
        webservice Id contactId {get;set;}
        webservice String status {get;set;}
        webservice String errorMessage {get;set;}
    }
}