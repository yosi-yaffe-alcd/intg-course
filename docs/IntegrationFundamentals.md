## 🔧 Integration Fundamentals

This section introduces the building blocks of integrating Salesforce with external systems. Whether you're sending data out (outbound) or receiving it (inbound), understanding direction, protocols, and implementation methods is critical.

---

### 📘 Key Concepts

| Concept           | Description                                                                                      |
|-------------------|--------------------------------------------------------------------------------------------------|
| **Synchronous**    | Real-time request/response. The client waits for Salesforce to return a result.                 |
| **Asynchronous**   | The request is accepted immediately but processed later (e.g., Platform Events, Queueable).     |
| **One-way**        | Data moves in one direction without acknowledgment (e.g., outbound messages).                   |
| **Two-way**        | Data flows both ways with full request-response cycles.                                         |
| **API Limits**     | Salesforce imposes limits (daily API calls, concurrent requests) that vary by edition & license.|

---

### 🔄 Integration Directions

- **Inbound:** External system → Salesforce  
- **Outbound:** Salesforce → External system

Salesforce can act as both a **provider** and a **consumer** of APIs.

---

### 📊 Implementation Grid

| Direction | Protocol | Integration Type | Salesforce Implementation | Example |
|----------|----------|------------------|-----------------------------|---------|
| **Inbound** | REST  | One/Two-way       | Standard REST API (sObjects, Query), Apex REST (`@RestResource`) | External system creates Account via `/sobjects/Account` |
| **Inbound** | SOAP  | One/Two-way       | Standard SOAP API, Custom Apex SOAP Web Service (`webservice`) | External ERP sends customer data via WSDL |
| **Outbound** | REST | One/Two-way       | Named Credentials + `Http` callout (Apex), External Services | Send order info to external inventory API |
| **Outbound** | SOAP | One/Two-way       | `WebServiceCallout` class + WSDL import (Apex) | Salesforce sends SOAP request to payment gateway |

---

### ⚙️ Salesforce Implementation Summary

#### ✅ **Inbound (External → Salesforce)**

- **Standard REST API**
  - Endpoints: `/sobjects`, `/query`
  - Auth via OAuth 2.0 or Session ID
- **Apex REST (`@RestResource`)**
  - Fully custom logic, JSON/XML support
  - Public via `/services/apexrest/<resource>`
- **Standard SOAP API**
  - Use WSDL provided by Salesforce
  - Requires login or session authentication
- **Apex SOAP Web Service**
  - Annotate methods with `webservice`
  - Exposed through custom WSDL

#### ✅ **Outbound (Salesforce → External)**

- **Apex HTTP Callouts (REST)**
  - Use `HttpRequest`, `HttpResponse` classes
  - Requires Named Credential for endpoint security
- **Apex SOAP Callouts**
  - Use WSDL to generate Apex classes
  - Easy to implement with `partner` or `enterprise` WSDLs
- **External Services**
  - Declarative tool to connect to OpenAPI (REST)
  - Great for Flow usage without Apex
- **Outbound Messages**
  - Workflow-based, SOAP only
  - One-way, no error handling

---

### ⚠️ Admin Tips

- **Always create a dedicated Integration User** with minimal permissions.
- **Monitor API Usage**: Setup → System Overview → API Usage.
- **Enable Debug Logs** for integration users when troubleshooting.
- **Named Credentials** simplify callouts and improve security.
- **Use Shield or Event Monitoring** for audit-grade tracking (optional).

---

⬅️ [Back to Overview](Overview.md)  
➡️ [Next: Protocols – REST vs SOAP »](Protocols.md)