# 🚀 Infrastructure Foundation Report
**Contoso Warsaw Enterprise Infrastructure**

---

| Parameter | Details |
| :--- | :--- |
| **Version** | `1.0` |
| **Date** | July 21, 2026 |
| **Author** | Contoso Administrator |
| **Domain** | `contosowarsaw.com` |
| **Primary DC** | `W-DC01` (192.168.10.10/24) |
| **Environment** | Windows Server 2022 Standard (Oracle VirtualBox) |

---

## 1. Executive Summary

This report documents the successful deployment of the core on-premises infrastructure for Contoso Warsaw. We have implemented a hardened **Windows Server 2022** environment serving as the primary Domain Controller for the `contosowarsaw.com` forest. 

The project established a professional Organizational Unit (OU) hierarchy and a standardized **AGDLP** (*Account-Global-Domain Local-Permissions*) group nesting model. We successfully performed an automated onboarding of 20 employees across five departments using custom PowerShell scripting and CSV data sources. 

Additionally, departmental file services were secured with granular NTFS permissions, and client workstations were standardized through Group Policy Objects (GPO), including automated drive mapping and security restrictions. The environment is now fully validated and prepared for hybrid synchronization with **Microsoft Entra ID**.

---

## 2. Environment Overview

* **Company:** Contoso Warsaw
* **Domain:** `contosowarsaw.com`
* **Primary DC:** `W-DC01`
* **IP Address:** `192.168.10.10/24`
* **Operating System:** Windows Server 2022 Standard
* **Hypervisor:** Oracle VirtualBox (*Isolated Network*)

---

## 3. Objectives

* Establish a stable and scalable on-premises identity foundation.
* Design an enterprise-grade Active Directory structure following industry best practices.
* Implement the **AGDLP** model to ensure secure and manageable resource access.
* Automate administrative workflows using PowerShell to reduce operational overhead.
* Prepare the infrastructure for seamless integration into a hybrid cloud model.

---

## 4. Implemented Components

* **Windows Server:** Installed and configured with static IP addressing, hardened hostname, and local security baselines.
* **Active Directory:** Promoted `W-DC01` to a Domain Controller, creating the root forest and managing the NTDS database.
* **DNS:** Configured Forward and Reverse Lookup Zones to ensure reliable name resolution for domain services.
* **Organizational Units:** Implemented a logical hierarchy (`OU=Departments`, `OU=Groups`, `OU=Users`, etc.) to separate administrative scopes.
* **Users:** Provisioned 20 initial employees using a PowerShell-driven CSV import process, ensuring consistent UPNs and department attributes.
* **Groups:** Deployed Global Groups (GG) for user roles and Domain Local Groups (DL) for resource permissions, adhering strictly to the AGDLP framework.
* **Group Policy:** Configured a Default Domain Policy for password complexity and custom GPOs for departmental restrictions (e.g., preventing wallpaper changes, automating network drive mappings `H:`, `S:` via GPP).
* **File Server:** Created departmental shares (HR, IT, Finance, etc.) on `D:\Departments` with disabled inheritance and explicit NTFS permissions for DL groups.
* **PowerShell Toolkit:** Developed a suite of administrative scripts:
  * `CreateOU.ps1`: Automates the generation of the corporate OU tree.
  * `Import-Users.ps1`: Performs bulk user provisioning from CSV files.
  * `AD-Report.ps1`: Generates identity and membership audit reports.

---

## 5. Validation

* ✅ **User Authentication:** Verified successful domain logons for new departmental accounts on test clients.
* ✅ **Automated Drive Mapping:** Confirmed that users automatically receive departmental network drives upon login.
* ✅ **GPO Enforcement:** Verified policy application (e.g., wallpaper lock) via `gpresult /r`.
* ✅ **Resource Isolation:** Confirmed that HR employees have *Modify* access to their folder while receiving *Access Denied* for IT/Finance shares.
* ✅ **Bulk Provisioning:** Validated that all 20 users were created with the correct UPN and forced password change at first logon.

---

## 6. Screenshots & Evidence

> *Note: Place screen captures inside the `/Screenshots` folder of the repository.*

* `01_ADUC_OU_Structure.png` — Full corporate OU hierarchy.
* `02_GPMC_Policies.png` — Linked GPOs and department targeting.
* `03_NTFS_Permissions.png` — AGDLP implementation on departmental folders.
* `04_PowerShell_Import.png` — Successful execution of the CSV onboarding script.
* `05_Client_Verification.png` — View of mapped drives on a user workstation.

---

## 7. Lessons Learned

1. **AGDLP Model:** Understood the critical importance of separating *"Who"* (Global Groups) from *"What"* (Domain Local Groups) to ensure enterprise scalability.
2. **Share vs. NTFS Permissions:** Learned that Share permissions should be broad (*Authenticated Users — Change*) while NTFS provides granular, restrictive control.
3. **PowerShell Pipeline:** Discovered the power of the pipeline (`|`) for filtering objects and the necessity of using `SecureString` for password handling.
4. **GPO Hierarchy (LSDOU):** Understood how policies applied at the OU level override domain-wide settings, with the exception of Account/Password policies.
5. **Sandbox Testing:** Verified that testing scripts in a dedicated `OU=Sandbox` prevents accidental damage to the production directory.

---

## 8. Definition of Done

| Component | Status |
| :--- | :---: |
| **Windows Server 2022** | ✅ |
| **Active Directory DS** | ✅ |
| **DNS Configuration** | ✅ |
| **OU Structure** | ✅ |
| **User Provisioning** | ✅ |
| **Group Management** | ✅ |
| **AGDLP Implementation** | ✅ |
| **Group Policy (GPO)** | ✅ |
| **File Server / NTFS** | ✅ |
| **PowerShell Automation** | ✅ |

---

## 9. Next Module

The on-premises identity infrastructure is complete and validated. The environment is ready for hybrid identity integration using **Microsoft Entra Connect** to synchronize local identities with the cloud.

---

## 📚 Skills Acquired

* **Enterprise AD Design:** Designing OU and Group structures for 150+ employee environments.
* **Infrastructure Hardening:** Configuring secure Windows Server roles and DNS foundations.
* **Advanced Permissions:** Implementing AGDLP and troubleshooting effective permissions.
* **Administrative Automation:** Writing and debugging PowerShell scripts for bulk object management.
* **Policy Management:** Centralizing configuration through Group Policy and Preferences.