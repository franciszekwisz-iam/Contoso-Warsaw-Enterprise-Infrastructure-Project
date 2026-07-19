# File Server Security & AGDLP Access Model

## Module Overview

This module covers the deployment of a secure departmental file server within an Active Directory environment using Microsoft's recommended **AGDLP (Accounts → Global Groups → Domain Local Groups → Permissions)** authorization model.

The objective was to design and implement a scalable enterprise file-sharing solution that separates share-level permissions from NTFS permissions while enforcing least privilege access and centralized administration through Active Directory security groups.

The implementation was performed on the domain controller **W-DC01** and provides department-based access control for organizational data.

---

# Objectives

* Deploy a centralized file server.
* Create departmental SMB shares.
* Implement Microsoft AGDLP authorization methodology.
* Separate Share Permissions from NTFS Permissions.
* Eliminate direct user-to-resource assignments.
* Disable NTFS inheritance on protected folders.
* Remove unnecessary default permissions.
* Enforce least privilege access.
* Provide management-level access across all departments.
* Automate deployment using PowerShell.

---

# Architecture Overview

## File Server

Server:

```text
W-DC01
```

Root Folder:

```text
C:\Shares
```

Department Folders:

```text
C:\Shares\HR
C:\Shares\IT
C:\Shares\Finance
C:\Shares\Sales
C:\Shares\Management
```

---

# SMB Share Architecture

Each department folder is published as an individual SMB share.

| Folder     | SMB Share          |
| ---------- | ------------------ |
| HR         | \W-DC01\HR         |
| IT         | \W-DC01\IT         |
| Finance    | \W-DC01\Finance    |
| Sales      | \W-DC01\Sales      |
| Management | \W-DC01\Management |

---

# Share Permission Strategy

Following Microsoft best practices, Share Permissions are intentionally simplified.

All departmental shares receive:

```text
Authenticated Users
    └── Full Control
```

This approach ensures that all authorization decisions are evaluated exclusively through NTFS permissions.

Benefits:

* Simplified administration
* Reduced troubleshooting complexity
* Consistent permission evaluation
* Centralized security management

---

# NTFS Security Design

All departmental folders are secured using explicit NTFS Access Control Lists (ACLs).

## Inheritance

Inheritance from the parent volume is disabled:

```text
Disable Inheritance
Convert inherited permissions into explicit permissions
```

---

## Removed Permissions

The following default entries are removed:

```text
Users
Authenticated Users
```

This prevents unauthorized lateral access to departmental data.

---

## Preserved Administrative Access

The following security principals retain full administrative access:

```text
SYSTEM
Administrators
```

---

# AGDLP Implementation

The environment uses Microsoft's AGDLP model.

## Global Groups (Department Membership)

```text
GG_HR
GG_IT
GG_Finance
GG_Sales
GG_Management
```

These groups contain user accounts.

---

## Domain Local Groups (Resource Permissions)

```text
DL_Shares_HR_Modify
DL_Shares_IT_Modify
DL_Shares_Finance_Modify
DL_Shares_Sales_Modify
DL_Shares_Management_Modify
```

These groups represent access rights to resources.

---

## Group Nesting

Example:

```text
GG_HR
   ↓
DL_Shares_HR_Modify
   ↓
C:\Shares\HR
```

The same structure exists for all departments.

---

# NTFS Permission Assignment

| Folder     | Permission Group            | NTFS Right |
| ---------- | --------------------------- | ---------- |
| HR         | DL_Shares_HR_Modify         | Modify     |
| IT         | DL_Shares_IT_Modify         | Modify     |
| Finance    | DL_Shares_Finance_Modify    | Modify     |
| Sales      | DL_Shares_Sales_Modify      | Modify     |
| Management | DL_Shares_Management_Modify | Modify     |

---

# Management Access Model

The Management department has access to all departmental data.

Additional permissions:

```text
DL_Shares_Management_Modify
```

is granted:

```text
Modify
```

on:

```text
C:\Shares\HR
C:\Shares\IT
C:\Shares\Finance
C:\Shares\Sales
C:\Shares\Management
```

This enables management personnel to access and modify all organizational data while maintaining AGDLP compliance.

---

# Effective Permissions Logic

The security model relies on the interaction between:

```text
SMB Share Permissions
+
NTFS Permissions
```

Windows always applies:

```text
Most Restrictive Permission Wins
```

Example:

User:

```text
Member of GG_HR
```

Attempts to access:

```text
\\W-DC01\IT
```

Result:

```text
Access Denied
```

Reason:

```text
Share Permission = Allowed
NTFS Permission = Not Granted

Final Result = Denied
```

---

# Validation

Verified:

* SMB share accessibility
* Group nesting
* NTFS ACL configuration
* Effective permissions
* Access denial for unauthorized departments
* Management access to all shares
* AD group membership inheritance

Tools used:

* Active Directory Users and Computers
* PowerShell
* File Explorer
* Advanced Security Settings
* Effective Access Tab

---

# Concepts Learned

* SMB Share Permissions
* NTFS Permissions
* Effective Permissions
* Access Control Lists (ACL)
* Security Principals
* AGDLP
* Global Groups
* Domain Local Groups
* Group Nesting
* Least Privilege
* Zero Trust
* Active Directory Authorization
* Windows File Services
* PowerShell Automation

---

# Skills Acquired

After completing this module I am able to:

* Design a secure enterprise file server.
* Implement AGDLP authorization.
* Configure SMB shares.
* Manage NTFS permissions.
* Disable inheritance securely.
* Remove unnecessary default permissions.
* Create and manage AD security groups.
* Configure group nesting.
* Implement department-based access control.
* Troubleshoot effective permissions.
* Automate file server deployment using PowerShell.

---

# Definition of Done

✔ Root file server structure deployed.

✔ Departmental SMB shares created.

✔ Share permissions configured according to Microsoft best practices.

✔ NTFS inheritance disabled.

✔ Default Users permissions removed.

✔ AGDLP model implemented.

✔ Global groups nested into Domain Local groups.

✔ NTFS Modify permissions assigned.

✔ Management access configured across all departments.

✔ Effective permissions validated.

✔ Fully automated PowerShell deployment script created.
