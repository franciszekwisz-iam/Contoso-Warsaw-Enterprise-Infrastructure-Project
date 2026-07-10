# Contoso Warsaw Enterprise Identity Infrastructure Lab

## 1. Project Overview
This repository documents the long-term design, deployment, automation, and security lifecycle of a hybrid Microsoft enterprise environment for **Contoso Warsaw** (simulating ~150 employees). 

Instead of isolated exercises, this project focuses on a continuous business growth narrative—scaling from a single on-premises server to a modern, highly secure cloud-integrated enterprise.

## 2. High-Level Architecture
The environment bridges traditional on-premises infrastructure with cloud-native identity management:

* **On-Premises Infrastructure:** Windows Server 2022, Active Directory Domain Services (AD DS), DNS, File Services.
* **Hybrid Connectivity:** Microsoft Entra Connect Sync (Classic Engine).
* **Cloud Infrastructure:** Microsoft Entra ID, Microsoft 365, Exchange Online, Microsoft Intune.

### Architectural Specifications
* **Corporate Entity:** Contoso Warsaw
* **On-Premises FQDN:** `contosowarsaw.com`
* **Cloud Tenant Primary Domain:** `Contosowarsaw.onmicrosoft.com`
* **Primary Domain Controller:** `W-DC01` (Static IP: `192.168.10.10/24`)

---

## 3. Project Roadmap & Implementation Lifecycle

### [📁 01-infrastructure-base](./01-infrastructure-base/)
* **Definition of Done:** `W-DC01` deployment, AD DS promotion to `contosowarsaw.com`, corporate OU tree design, automated onboarding of 150 users via PowerShell (`New-ADUser`), AGDLP group framework implementation, NTFS file share permissions.

### [📁 02-hybrid-identity-entra](./02-hybrid-identity-entra/)
* **Definition of Done:** Alternative UPN suffixes added, Entra Connect Sync engine installation and filtering, soft/hard-match validations, hybrid user lifecycle testing.

### [📁 03-cloud-services-exchange](./03-cloud-services-exchange/)
* **Definition of Done:** Exchange Online architecture, automated license assignments via Microsoft Graph PowerShell, Shared Mailboxes and Distribution Lists provisioning.

### [📁 04-endpoint-management-intune](./04-endpoint-management-intune/)
* **Definition of Done:** MDM authority setup, Autopilot profile design, Compliance Policies, BitLocker encryption policies, and Windows Update Rings configuration.

### [📁 05-enterprise-security-governance](./05-enterprise-security-governance/)
* **Definition of Done:** Conditional Access Zero-Trust policies (MFA enforcement), Break-Glass account deployment, Self-Service Password Reset (SSPR), Administrative Units provisioning, and advanced offboarding automation script (`offboarding.ps1`).

---

## 4. Definition of Done (DoD) per Module
Every technical block within this repository is considered complete *only* when it satisfies the following criteria:
1. **Functional Environment:** The configuration is live and verified on the lab environment.
2. **PowerShell Automation:** Critical processes are handled via production-ready scripts.
3. **Monolithic README:** Complete documentation embedded into a single, comprehensive `README.md` within the module folder.
4. **Visual Evidence:** Relevant configuration screenshots and architecture diagrams stored in local assets.