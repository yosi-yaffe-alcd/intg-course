# Payload Types & Examples

When integrating systems with Salesforce, understanding payload formats and how to structure data is essential for seamless communication. Below are the most common payload types used in integrations, along with their characteristics and sample payloads.

---

### Common Payload Formats

| Format | Description | Characteristics | Use Cases |
|--------|-------------|-----------------|-----------|
| **JSON** | Lightweight, text-based data format | Human-readable, easy to parse, widely used in REST APIs | Mobile apps, web services, REST APIs |
| **XML** | Markup language with nested tags | Verbose, supports schemas (XSD) for validation, common in SOAP APIs | Legacy systems, SOAP web services, complex message structures |
| **CSV** | Comma-separated values, simple text format | Easy to generate and parse, flat tabular data | Bulk data import/export, batch processing |

---

### Example Payloads Side by Side

| JSON (REST) Example | XML (SOAP) Example | CSV Example |
|---------------------|--------------------|-------------|
| ```json
{
  "accountName": "Acme Corporation",
  "contactFirstName": "John",
  "contactLastName": "Doe",
  "contactEmail": "john.doe@acme.com"
}
``` | ```xml
<CreateCustomerREQ>
  <accountName>Acme Corporation</accountName>
  <contactFirstName>John</contactFirstName>
  <contactLastName>Doe</contactLastName>
  <contactEmail>john.doe@acme.com</contactEmail>
</CreateCustomerREQ>
``` | ```csv
accountName,contactFirstName,contactLastName,contactEmail
Acme Corporation,John,Doe,john.doe@acme.com
``` |

---

### Integration Considerations

- **JSON** is preferred for lightweight, fast RESTful integrations.
- **XML** is favored when strict schema validation and complex data structures are required.
- **CSV** is efficient for batch imports but limited to flat data.

---

### Navigation

[⬅️ Previous: Integration Fundamentals](./integration-fundamentals.md)  
[➡️ Next: Protocols: REST vs SOAP](./protocols-rest-vs-soap.md)