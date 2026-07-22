# 🚀 CONTOSO WARSAW — HYBRID IDENTITY LAB REPORT

## 📌 Module 02: Microsoft Entra ID & Hybrid Identity Management

### 📑 Executive Summary
This module covers the end-to-end design, implementation, testing, and troubleshooting of a Hybrid Identity infrastructure for **Contoso Warsaw**. The goal was to bridge an on-premises Active Directory Domain Services (AD DS) environment with a Microsoft Entra ID tenant, ensuring identity synchronization, proper UPN routing, life-cycle governance, and automated access control.

---

## 🏗️ 1. Architecture & Core Infrastructure Setup

* **Directory Integration:**
  - Configured `Active Directory Domains and Trusts` to add the custom UPN Suffix `@contosowarsaw.com`.
  - Aligned local user UPNs with the cloud-verified custom domain to enable Single Sign-On (SSO) readability and proper routing.
* **Identity Model:**
  - Evaluated Cloud-Only vs. Hybrid Identity (PHS/PTA) vs. Federated Identity (ADFS).
  - Selected **Password Hash Sync (PHS)** for cloud resiliency and simplified authentication.
* **Tenant Configuration:**
  - Provisioned and configured the `contosowarsaw.onmicrosoft.com` Microsoft 365 tenant.
  - Linked and verified the custom domain `contosowarsaw.com`.

---

## ⚙️ 2. Microsoft Entra Connect Deployment & Sync Configuration

* **Engine Installation:**
  - Deployed Microsoft Entra Connect on domain controller `W-DC01`.
  - Configured Password Hash Synchronization (PHS) with seamless sign-on capabilities.
* **OU Filtering:**
  - Configured selective OU filtering (`OU=SandboxOU`, `OU=Company`, and later `OU=Marketing`) to prevent unmanaged directory inflation.
  - Verified default exclusion behaviors for newly created Organizational Units.
* **Synchronization Management:**
  - Configured and monitored the 30-minute automated scheduler.
  - Used **Windows PowerShell 5.1** (`Start-ADSyncSyncCycle`) for manual execution of `Delta` and `Initial` synchronization cycles.

---

## 🔄 3. Hybrid Lifecycle Management & Verification

* **Attribute Flow & Source of Authority:**
  - Verified that local AD DS acts as the **Source of Authority** for synchronized objects.
  - Validated that attribute modifications (e.g., Last Name, Display Name) in AD DS correctly flow to Entra ID, while Entra Admin Center blocks cloud-side edits.
* **Account Status & Offboarding Flows:**
  - Executed `Disable-ADAccount` locally and confirmed propagation to Entra ID (`AccountEnabled = False`).
  - Tested **Soft Delete**: Moving accounts outside the sync scope (e.g., to default `CN=Users`) places the corresponding Entra ID account in the **Deleted users** container for a 30-day retention period.
* **Identity Matching Logic:**
  - Analyzed **Soft Match** mechanisms (UPN & Primary SMTP matching).
  - Analyzed **Hard Match** mechanisms (`mS-DS-ConsistencyGuid` mapping to cloud `ImmutableId`).

---

## 🔍 4. Troubleshooting, Diagnostics & Incident Handling

* **PowerShell Compatibility Issue:**
  - *Symptom:* `Start-ADSyncSyncCycle` threw errors and COM class failures (`REGDB_E_CLASSNOTREG`) when executed in PowerShell 7 Core.
  - *Root Cause:* The `ADSync` module relies on .NET Framework 4.x binaries and COM interfaces incompatible with modern .NET Core.
  - *Resolution:* Shifted execution to native **Windows PowerShell 5.1 (64-bit)**.
* **Service Monitoring:**
  - Evaluated **Windows Event Viewer** (`eventvwr.msc`) under `Windows Logs -> Application` filtered by source `Directory Synchronization` (Event ID 904 for scheduler success).
  - Used **Synchronization Service Manager** (`miisclient.exe`) to inspect Connector Space, Metaverse transformations, and detailed export statistics.

---

## 💼 5. Final Business Scenario Execution (Marketing OU Onboarding)

* **Objective:** Provision a new Marketing department in AD DS, include it in the sync scope, and verify readiness in Entra ID.
* **Steps Completed:**
  1. Created `OU=Marketing` in AD DS with test identities using the `@contosowarsaw.com` UPN suffix.
  2. Reconfigured Microsoft Entra Connect wizard via *Customize synchronization options* to include `OU=Marketing`.
  3. Triggered a full initial cycle via Windows PowerShell 5.1:
     ```powershell
     Start-ADSyncSyncCycle -PolicyType Initial
     ```
  4. Verified in **Microsoft Entra Admin Center** (`entra.microsoft.com`):
     - Users appeared under *All Users*.
     - `On-premises sync enabled` set to **Yes**.
     - Domain suffix correctly reflected `@contosowarsaw.com`.

---

## 📊 6. Definition of Done & Module Status

| Area | Status | Notes |
| :--- | :---: | :--- |
| **Entra ID & Tenant Setup** | ✅ Completed | Tenant, custom domain, and cloud/synced users fully configured. |
| **UPN & Domain Matching** | ✅ Completed | Suffix configured in AD DS, routing verified. |
| **Entra Connect Installation** | ✅ Completed | PHS active, OU filtering functional. |
| **Lifecycle Testing** | ✅ Completed | Disabling, attribute sync, and Soft Delete tested. |
| **Troubleshooting Skills** | ✅ Completed | PS 5.1 resolution, Event Viewer (ID 904), `miisclient.exe` audited. |
| **Practical Examination** | ✅ Passed | Grade: **Junior Ready** |
| **Business Scenario** | ✅ Executed | Marketing OU successfully provisioned and verified. |

---
**Module Status:** ✅ **MODULE 02 COMPLETED & CLOSED**