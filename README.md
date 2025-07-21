# 🌐 Salesforce Integration Course

Welcome to the **Salesforce Integration Course**! This course will guide you through integrating external systems with Salesforce using APIs, protocols, and tools like Postman.

> **Audience**: Salesforce Developers, Admins, and Technical Architects  
> **Duration**: Approx. 8–10 hours  
> **Level**: Intermediate

---

## 📘 Syllabus

| Module | Topic | Description |
|--------|-------|-------------|
| 1️⃣ | [Overview](docs/Overview.md) | Introduction to the course, goals, and prerequisites |
| 2️⃣ | [Integration Fundamentals](docs/IntegrationFundamentals.md) | Core concepts and integration strategies in Salesforce |
| 3️⃣ | [Protocols](docs/Protocols.md) | Overview of REST, SOAP, and other communication protocols |
| 4️⃣ | [Payload Types](docs/PayloadTypes.md) | Understanding JSON, XML, and other message formats |
| 5️⃣ | [Postman & Org Setup](docs/PostmanOrgSetup.md) | Setting up Postman and Salesforce for testing APIs |
| 6️⃣ | [Troubleshooting](docs/Troubleshooting.md) | Diagnosing and solving integration issues |
| 7️⃣ | [Hands-On Lab](docs/HandsOnLab.md) | Real-world integration lab exercise |
| 8️⃣ | [Summary](docs/Summary.md) | Recap and next steps |

---

## 🧪 Lab Materials

Download and import the following files into Postman for hands-on exercises:

- 📁 [Integ-Course.postman_collection.json](lab/Integ-Course.postman_collection.json) – Postman collection of Salesforce integration requests  
- 🌐 [SF Integ-Course Student.postman_environment.json](lab/SF%20Integ-Course%20Student.postman_environment.json) – Postman environment with variables for the course

---

### Package Contents

This deployment package includes:

- ⚙️ External Connected App (for OAuth integration)
- 🔐 Permission Set (granting required access)
- 🏗️ Custom Fields & Platform Event Object (for event-driven integration)
- 📄 Several Apex Classes (integration logic, REST services, etc.)

---

## 🚀 Deployment Instructions (Salesforce CLI - `sf`)

Make sure you have the **Salesforce CLI (`sf`)** installed:  
[https://developer.salesforce.com/tools/salesforcecli](https://developer.salesforce.com/tools/salesforcecli)

### 1. Authenticate to your Salesforce org

```bash
cd app

sf login org --alias MyDevOrg --instance-url https://login.salesforce.com

sf project deploy start --source-dir force-app --target-org MyDevOrg

sf org assign permset --name IntegrationCoursePermissions --target-org MyDevOrg

sf org open --target-org MyDevOrg
```