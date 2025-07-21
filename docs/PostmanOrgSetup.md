# Setup Connection: Postman to Salesforce using External Connected App + Client Credentials Flow

---

## Overview

This guide explains how to configure Salesforce and Postman for OAuth 2.0 Client Credentials flow using an **External Connected App** and a dedicated **Integration User**. This setup enables secure API access for CRUD operations on Account, Contact, and Lead objects, as well as calling custom SOAP and REST web services (e.g., `CustomerWS` and `CustomerRESTWS`).

---

## 1. Create and Configure a Salesforce Integration User

This user will be the **client credential user** for your External Connected App.

### Steps:

- Go to **Setup > Users > Users** and click **New User**.
- Fill in the details:
  - **Username:** `SYSTEM_NAME.api@example.com` (must be unique and in email format)
  - **Email:** Use a dedicated email for monitoring integration alerts.
  - **Alias:** `intuser`
  - **User License:** Choose **Salesforce Integration** license.
  - **Profile:** Assign a **Salesforce API Only System Integrations** created specifically for integration users (do not use a standard profile).
- Save the user.

### Assign Permission Set License and API Only Permission:

- After user creation, assign the **“Salesforce API Integration” Permission Set License** or a custom permission set with the **API Only** permission enabled.
- This restricts the user to API access only and disables UI login.
- To assign:
  - Navigate to **Setup > Users > Permission Set Licenses**.
  - Find the **Salesforce API Integration** license or your custom permission set.
  - Assign it to the integration user.

See detailed steps here: [How to Set Up Free API-Only Integration Users (Salesforce Ben)](https://www.salesforceben.com/how-to-set-up-free-api-only-integration-users/)

### Best Practices ([Salesforce Admin Blog](https://admin.salesforce.com/blog/2023/best-practices-for-configuring-your-integration-user)):

- Use a **dedicated integration user** to isolate API access from regular users.
- Apply **least privilege**:
  - Custom profile or permission sets with only required permissions.
  - Enable **API Enabled** permission.
  - CRUD access only to **Account**, **Contact**, **Lead**.
  - Access to required Apex classes/web services (`CustomerWS`, `CustomerRESTWS`).
- Restrict login with **Login IP Ranges** and **Login Hours**.
- Disable UI login if possible (if only API access needed).
- Use strong passwords and rotate them regularly.
- Monitor login activity and API usage.
- Avoid assigning roles or sharing that expose excessive data.

---

## 2. Create a Custom Profile or Permission Set for the Integration User

- Create a new **Profile** or **Permission Set** named `IntegrationUserProfile`.
- Enable:
  - **API Enabled**
  - Object permissions: **Read, Create, Edit, Delete** on Account, Contact, Lead.
  - Apex Class Access: grant access to `CustomerWS` and `CustomerRESTWS` Apex classes.
- Assign this profile or permission set to the integration user.

---

## 3. Create an External Connected App in Salesforce

- Navigate to **Setup > External Connected Apps > New External Connected App**.
- Enter:
  - **Name:** `PostmanIntegrationApp`
  - **API Name:** auto-filled
  - **Contact Email:** your email
- Under **OAuth Settings**:
  - Enable **Enable OAuth Settings**
  - Set **Callback URL:** (can be placeholder, e.g., `https://localhost/callback` since client credentials flow doesn’t use redirect)
  - Select **OAuth Scopes**:
    - `Access and manage your data (api)`
  - Under **Client Credentials User**, select the **Integration User** created earlier.
- Save the connected app and wait for provisioning (can take a few minutes).
- Note the **Consumer Key** and **Consumer Secret** for Postman setup.

---

## 4. Configure Postman for OAuth 2.0 Client Credentials Flow

- Open Postman.
- Create a new **Request**.
- In the **Authorization** tab:
  - Type: **OAuth 2.0**
  - Grant Type: **Client Credentials**
  - Access Token URL:  
    `https://login.salesforce.com/services/oauth2/token`  
    (or use `test.salesforce.com` for sandbox)
  - Client ID: Your connected app’s **Consumer Key**
  - Client Secret: Your connected app’s **Consumer Secret**
  - Scope: (leave blank or set scopes as configured)
- Click **Get New Access Token**.
- After successful token retrieval, you can use the token for API calls.

---

## References

- [Salesforce External Connected Apps: OAuth Client Credentials Flow](https://help.salesforce.com/s/articleView?id=xcloud.configure_oauth_code_credentials_flow_external_client_apps.htm&type=5)
- [Best Practices for Configuring Your Integration User](https://admin.salesforce.com/blog/2023/best-practices-for-configuring-your-integration-user)
- [Salesforce OAuth 2.0 Documentation](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/intro_understanding_web_server_oauth_flow.htm)

---

## Navigation

[⬅ Previous: Payload Types & Examples](PayloadTypes.md)  
[Next: Troubleshooting & Common Errors ➡](troubleshooting.md)