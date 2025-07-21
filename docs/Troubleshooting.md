# Troubleshooting & Common Errors in Salesforce Integration

---

## Overview

Integration between Salesforce and external systems can encounter various issues during development and production. This section covers common errors, their causes, and troubleshooting tips to help you identify and resolve integration problems efficiently.

---

## 1. Authentication & Authorization Errors

| Error Message                     | Possible Cause                                         | Troubleshooting Steps                                      |
|----------------------------------|------------------------------------------------------|------------------------------------------------------------|
| `invalid_client`                 | Incorrect Client ID or Secret                         | Verify Connected App credentials in Salesforce and Postman |
| `invalid_grant`                  | Wrong username/password or user locked                | Confirm integration user credentials and status            |
| `insufficient_scope`             | Missing OAuth scopes                                  | Add required scopes in Connected App                       |
| `expired_token`                  | Access token expired                                 | Refresh token or get a new token                           |
| `unauthorized_client`            | Client not authorized for this grant type             | Check OAuth flow configuration in Connected App           |

---

## 2. API Limit and Governor Limits

| Error Message                   | Description                                          | How to Handle                                              |
|--------------------------------|------------------------------------------------------|------------------------------------------------------------|
| `REQUEST_LIMIT_EXCEEDED`       | Exceeded API call limits                             | Monitor usage, batch requests, optimize calls             |
| `CPU_TIME_LIMIT_EXCEEDED`      | Apex CPU time limit exceeded                         | Optimize Apex code, reduce complex logic                   |
| `MALFORMED_ID`                 | Invalid Salesforce record ID                         | Verify IDs used in API calls                                |

---

## 3. Data Validation Errors

| Error Message                  | Description                                          | Troubleshooting                                             |
|-------------------------------|------------------------------------------------------|-------------------------------------------------------------|
| `FIELD_INTEGRITY_EXCEPTION`   | Required fields missing or invalid values            | Check required fields and field formats                     |
| `DUPLICATE_VALUE`             | Unique field violation                               | Ensure uniqueness or update matching records                |
| `INVALID_FIELD`               | Field does not exist or is not accessible            | Verify field API names and user permissions                  |

---

## 4. SOAP and REST Specific Errors

| Error Message                  | Cause                                                | Resolution                                                 |
|-------------------------------|------------------------------------------------------|------------------------------------------------------------|
| `INVALID_SESSION_ID`           | Session expired or invalid                           | Re-authenticate and get new token                          |
| `Malformed SOAP Header`        | Incorrect SOAP message structure                     | Validate WSDL and SOAP envelope                             |
| `404 Not Found`                | Incorrect REST endpoint URL                          | Verify REST resource path                                   |
| `415 Unsupported Media Type`   | Missing or incorrect Content-Type header             | Use `application/json` for REST, `text/xml` for SOAP       |

---

## 5. Debugging Tips

- **Use Salesforce Debug Logs**: Enable logs for integration user to trace API calls and Apex executions.
- **Postman Console**: Inspect request/response headers and payloads for errors.
- **Salesforce Setup Audit Trail**: Review recent changes to profiles, permission sets, or connected apps.
- **Check API Versions**: Ensure client uses compatible API version with Salesforce org.
- **Validate Payloads**: Use schema validation tools to verify JSON or XML formats.

---

## 6. Tools & Resources

- [Salesforce Debug Logs](https://help.salesforce.com/s/articleView?id=sf.code_debug_log.htm)
- [Salesforce API Limits](https://developer.salesforce.com/docs/atlas.en-us.232.0.api_rest.meta/api_rest/intro_rate_limiting.htm)
- [Postman Console](https://learning.postman.com/docs/sending-requests/debugging-api-requests/)
- [WSDL Validator](https://www.wsdl-analyzer.com/)

---

## Navigation

[⬅ Previous: Setup Connection with Postman and External Connected App](PostmanOrgSetup.md)  
[Next: Hands-On Lab ➡](HandsOnLab.md)
