# Hands-On Lab: Building Salesforce Integration

---

## Lab Overview

In this hands-on lab, you will practice integrating Salesforce using different authentication flows and API methods. You will:

- Authenticate with Salesforce using Client Credentials OAuth flow
- Create and use custom REST and SOAP APIs
- Work with standard Salesforce REST APIs for common CRUD operations
- Use Platform Events to publish messages
- Use Composite API to perform multiple operations in a single request

---

## Prerequisites

- Salesforce org with API access
- Postman installed
- Integration user and External Connected App configured (see previous topics)
- Basic understanding of Salesforce REST and SOAP APIs

---

## Lab Steps

### 1. Authentication (Client Credentials Flow)

- Obtain OAuth 2.0 access token using Client Credentials flow
- Use `client_id` and `client_secret` from the external connected app
- Store access token for subsequent API calls

### 2. Custom API: Create Customer

#### a) REST API - Create Customer

- POST to custom REST endpoint `/api1/Customer`
- Provide payload with account and contact details
- Verify response contains Salesforce record IDs and status

#### b) SOAP API - Create Customer

- Invoke SOAP service `CustomerWS` using WSDL
- Use SOAP message with customer details
- Confirm successful creation from SOAP response

### 3. Standard REST API

#### a) Check API Limits

- GET `/services/data/vXX.X/limits`
- Review current API usage and limits

#### b) Query Accounts

- Use SOQL query with REST API `/services/data/vXX.X/query?q=SELECT+Id,+Name+FROM+Account`
- Confirm returned records

#### c) Create Account

- POST to `/services/data/vXX.X/sobjects/Account/`
- Provide JSON payload for new account

### 4. Platform Events

#### a) Create `Message__e` Platform Event

- Publish a platform event message via REST `/services/data/vXX.X/sobjects/Message__e/`
- Include relevant event fields in payload

### 5. Composite API Operations

#### a) Upsert Account based on External ID

- Use Composite REST API `/services/data/vXX.X/composite/sobjects/`
- Perform UPSERT operation using `SystemExtId__c` as external ID

#### b) Add a File to the Account

- Upload a file (ContentVersion) linked to the Account record

#### c) Query Account Details

- Query detailed account info in the same composite request

---

## Tips and Best Practices

- Use environment variables in Postman to store and reuse access tokens
- Validate all request payloads against OpenAPI or WSDL specs
- Monitor API limits regularly during integration testing
- Leverage Salesforce debug logs for troubleshooting SOAP calls
- Use Composite API to reduce API calls and improve performance

---

## Resources

- [Salesforce REST API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/)
- [Salesforce SOAP API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/)
- [Postman Documentation](https://learning.postman.com/docs/getting-started/introduction/)
- [Salesforce Platform Events](https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_intro.htm)

---

[⬅ Previous Topic: Troubleshooting & Common Errors ➡](Troubleshooting.md)
[Next Topic: Summary](Summary.md)