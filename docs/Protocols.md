## 🌐 Protocols: REST vs SOAP

Salesforce supports both REST and SOAP-based integrations. Choosing the right protocol depends on your use case, performance needs, and client/server capabilities.

---

### 📊 Comparison Table

| Feature              | **REST**                                       | **SOAP**                                             |
|----------------------|-----------------------------------------------|------------------------------------------------------|
| **Protocol Type**     | Architectural style (uses HTTP)               | Protocol with strict standards                       |
| **Message Format**    | JSON (preferred), XML                         | XML only                                             |
| **Performance**       | Fast and lightweight                          | More overhead due to XML & envelope structure        |
| **Transport**         | HTTP(S)                                       | HTTP(S), SMTP                                        |
| **Verb Mapping**      | HTTP verbs (GET, POST, PUT, DELETE)           | Single `POST`, operation defined in XML envelope     |
| **Schema Validation** | Optional via JSON Schema                      | Enforced via XSD/WSDL                                |
| **Ease of Use**       | Easier with tools like Postman or fetch()     | Requires XML tools and WSDL parsing                  |
| **Security**          | OAuth 2.0, HTTPS                              | WS-Security (optional), HTTPS                        |
| **Tooling**           | Lightweight clients (browser, Postman, curl)  | Requires WSDL-based client generation                |
| **Best For**          | Web/Mobile Apps, Quick APIs                   | Enterprise Systems, Strict Contracts                 |

---

### ⚙️ Standard Salesforce API Support

#### ✅ REST API (Standard)
- URL-based
- Used for lightweight, modern web integrations
- Authentication: OAuth 2.0
- Supports: CRUD on sObjects, Queries, Composite API

🔗 [Salesforce APIs](https://developer.salesforce.com/docs/apis#browse)
🔗 [APIs and Integration](https://developer.salesforce.com/developer-centers/integration-apis)
🔗 [Salesforce APIs for Postman](https://github.com/forcedotcom/postman-salesforce-apis)

#### ✅ SOAP API (Standard)
- XML-based communication
- Used by enterprise systems needing strict structure
- Authentication: Login call or session ID
- Exposes full schema through WSDL

🔗 [📎 Download Exterprise WSDL](integrationSpecs/enterpriseWsdl.xml)
---

### 🛠️ Custom API Examples

#### 📥 Inbound REST (Custom Apex REST API)
- Implements `@RestResource` in Apex
- Fully controllable JSON payload structure
- Public endpoint: /services/apexrest/api1/Customer


🔗 [📎 Download OpenAPI Spec](integrationSpecs/CustomerAPIspec.yaml)

#### 📥 Inbound SOAP (Custom Apex SOAP Web Service)
- Annotated `webservice` methods in Apex
- Consumed using WSDL by external clients
- Example operation: `createCustomer`

🔗 [📎 Download WSDL](integrationSpecs/CustomerWS.xml)

---

## Customer REST vs SOAP - Spec Comparison

**REST (OpenAPI Spec)**
```yaml
openapi: 3.0.3
info:
  title: Customer REST API
  description: REST API to create a Customer (Account + Contact) in Salesforce
  version: 1.0.0
servers:
  - url: https://yourInstance.salesforce.com/services/apexrest
    description: Salesforce Production Server

paths:
  /api1/Customer:
    post:
      summary: Create a new customer (Account + Contact)
      operationId: createCustomer
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/CreateCustomerREQ'
      responses:
        '200':
          description: Successfully created account and contact
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/CreateCustomerRES'
        '400':
          description: Invalid input
        '500':
          description: Internal server error

components:
  schemas:
    CreateCustomerREQ:
      type: object
      properties:
        accountName:
          type: string
          example: Acme Corporation
        contactFirstName:
          type: string
          example: John
        contactLastName:
          type: string
          example: Doe
        contactEmail:
          type: string
          format: email
          example: john.doe@acme.com
      required:
        - accountName
        - contactFirstName
        - contactLastName
        - contactEmail

    CreateCustomerRES:
      type: object
      properties:
        accountId:
          type: string
          example: 001xx000003DGbTAAW
        contactId:
          type: string
          example: 003xx000004TmiBAAS
        status:
          type: string
          example: success
        errorMessage:
          type: string
          nullable: true
          example: null
```

**SOAP (WSDL)**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
 Web Services API : CustomerWS
-->
<definitions targetNamespace="http://soap.sforce.com/schemas/class/CustomerWS" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.xmlsoap.org/wsdl/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="http://soap.sforce.com/schemas/class/CustomerWS">
 <types>
  <xsd:schema elementFormDefault="qualified" targetNamespace="http://soap.sforce.com/schemas/class/CustomerWS">
   <xsd:element name="AllowFieldTruncationHeader">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="allowFieldTruncation" type="xsd:boolean"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
   <xsd:element name="CallOptions">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="client" type="xsd:string"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
   <xsd:element name="DebuggingHeader">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="categories" minOccurs="0" maxOccurs="unbounded" type="tns:LogInfo"/>
      <xsd:element name="debugLevel" type="tns:LogType"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
   <xsd:complexType name="LogInfo">
    <xsd:sequence>
     <xsd:element name="category" type="tns:LogCategory"/>
     <xsd:element name="level" type="tns:LogCategoryLevel"/>
    </xsd:sequence>
   </xsd:complexType>
   <xsd:simpleType name="LogCategory">
    <xsd:restriction base="xsd:string">
     <xsd:enumeration value="Db"/>
     <xsd:enumeration value="Workflow"/>
     <xsd:enumeration value="Validation"/>
     <xsd:enumeration value="Callout"/>
     <xsd:enumeration value="Apex_code"/>
     <xsd:enumeration value="Apex_profiling"/>
     <xsd:enumeration value="Visualforce"/>
     <xsd:enumeration value="System"/>
     <xsd:enumeration value="Wave"/>
     <xsd:enumeration value="Nba"/>
     <xsd:enumeration value="Data_access"/>
     <xsd:enumeration value="All"/>
    </xsd:restriction>
   </xsd:simpleType>
   <xsd:simpleType name="LogCategoryLevel">
    <xsd:restriction base="xsd:string">
     <xsd:enumeration value="None"/>
     <xsd:enumeration value="Finest"/>
     <xsd:enumeration value="Finer"/>
     <xsd:enumeration value="Fine"/>
     <xsd:enumeration value="Debug"/>
     <xsd:enumeration value="Info"/>
     <xsd:enumeration value="Warn"/>
     <xsd:enumeration value="Error"/>
    </xsd:restriction>
   </xsd:simpleType>
   <xsd:simpleType name="LogType">
    <xsd:restriction base="xsd:string">
     <xsd:enumeration value="None"/>
     <xsd:enumeration value="Debugonly"/>
     <xsd:enumeration value="Db"/>
     <xsd:enumeration value="Profiling"/>
     <xsd:enumeration value="Callout"/>
     <xsd:enumeration value="Detail"/>
    </xsd:restriction>
   </xsd:simpleType>
   <xsd:element name="DebuggingInfo">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="debugLog" type="xsd:string"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
   <xsd:element name="SessionHeader">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="sessionId" type="xsd:string"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
   <xsd:simpleType name="ID">
    <xsd:restriction base="xsd:string">
     <xsd:length value="18"/>
     <xsd:pattern value="[a-zA-Z0-9]{18}"/>
    </xsd:restriction>
   </xsd:simpleType>
   <xsd:complexType name="CreateCustomerREQ">
    <xsd:sequence>
     <xsd:element name="accountName" minOccurs="0" type="xsd:string" nillable="true"/>
     <xsd:element name="contactEmail" minOccurs="0" type="xsd:string" nillable="true"/>
     <xsd:element name="contactFirstName" minOccurs="0" type="xsd:string" nillable="true"/>
     <xsd:element name="contactLastName" minOccurs="0" type="xsd:string" nillable="true"/>
    </xsd:sequence>
   </xsd:complexType>
   <xsd:complexType name="CreateCustomerRESP">
    <xsd:sequence>
     <xsd:element name="accountId" minOccurs="0" type="tns:ID" nillable="true"/>
     <xsd:element name="contactId" minOccurs="0" type="tns:ID" nillable="true"/>
     <xsd:element name="errorMessage" minOccurs="0" type="xsd:string" nillable="true"/>
     <xsd:element name="status" minOccurs="0" type="xsd:string" nillable="true"/>
    </xsd:sequence>
   </xsd:complexType>
   <xsd:complexType name="address">
    <xsd:complexContent>
     <xsd:extension base="tns:location">
      <xsd:sequence>
       <xsd:element name="city" type="xsd:string"/>
       <xsd:element name="country" type="xsd:string"/>
       <xsd:element name="countryCode" type="xsd:string"/>
       <xsd:element name="geocodeAccuracy" type="xsd:string"/>
       <xsd:element name="postalCode" type="xsd:string"/>
       <xsd:element name="state" type="xsd:string"/>
       <xsd:element name="stateCode" type="xsd:string"/>
       <xsd:element name="street" type="xsd:string"/>
      </xsd:sequence>
     </xsd:extension>
    </xsd:complexContent>
   </xsd:complexType>
   <xsd:complexType name="location">
    <xsd:sequence>
     <xsd:element name="latitude" type="xsd:double"/>
     <xsd:element name="longitude" type="xsd:double"/>
    </xsd:sequence>
   </xsd:complexType>
   <xsd:element name="createCustomer">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="cust" type="tns:CreateCustomerREQ" nillable="true"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
   <xsd:element name="createCustomerResponse">
    <xsd:complexType>
     <xsd:sequence>
      <xsd:element name="result" type="tns:CreateCustomerRESP" nillable="true"/>
     </xsd:sequence>
    </xsd:complexType>
   </xsd:element>
  </xsd:schema>
 </types>
 <!-- Message for the header parts -->
 <message name="Header">
  <part name="AllowFieldTruncationHeader" element="tns:AllowFieldTruncationHeader"/>
  <part name="CallOptions" element="tns:CallOptions"/>
  <part name="DebuggingHeader" element="tns:DebuggingHeader"/>
  <part name="DebuggingInfo" element="tns:DebuggingInfo"/>
  <part name="SessionHeader" element="tns:SessionHeader"/>
 </message>
 <!-- Operation Messages -->
 <message name="createCustomerRequest">
  <part element="tns:createCustomer" name="parameters"/>
 </message>
 <message name="createCustomerResponse">
  <part element="tns:createCustomerResponse" name="parameters"/>
 </message>
 <portType name="CustomerWSPortType">
  <operation name="createCustomer">
   <input message="tns:createCustomerRequest"/>
   <output message="tns:createCustomerResponse"/>
  </operation>
 </portType>
 <binding name="CustomerWSBinding" type="tns:CustomerWSPortType">
  <soap:binding style="document" transport="http://schemas.xmlsoap.org/soap/http"/>
  <operation name="createCustomer">
   <soap:operation soapAction=""/>
   <input>
    <soap:header use="literal" part="SessionHeader" message="tns:Header"/>
    <soap:header use="literal" part="CallOptions" message="tns:Header"/>
    <soap:header use="literal" part="DebuggingHeader" message="tns:Header"/>
    <soap:header use="literal" part="AllowFieldTruncationHeader" message="tns:Header"/>
    <soap:body use="literal" parts="parameters"/>
   </input>
   <output>
    <soap:header use="literal" part="DebuggingInfo" message="tns:Header"/>
    <soap:body use="literal"/>
   </output>
  </operation>
 </binding>
 <service name="CustomerWSService">
  <documentation></documentation>
  <port binding="tns:CustomerWSBinding" name="CustomerWS">
   <soap:address location="https://can98.sfdc-58ktaz.salesforce.com/services/Soap/class/CustomerWS"/>
  </port>
 </service>
</definitions>
```

---

[⬅️ Back: Integration Fundamentals](IntegrationFundamentals.md) | [Next: Payload Types ➡️](PayloadTypes.md)