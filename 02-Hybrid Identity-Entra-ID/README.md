# Module 02 — Hybrid Identity (Microsoft Entra ID)

## Overview

This module documents the implementation of a hybrid identity environment by integrating the on-premises Active Directory infrastructure with Microsoft Entra ID.

After completing the Infrastructure Foundation module, the Contoso Warsaw environment is ready to extend identity management into the Microsoft cloud.

The primary objective of this module is to understand how identities flow between Active Directory and Microsoft Entra ID while maintaining a secure and manageable hybrid architecture.

---

# Business Scenario

Contoso Warsaw has grown beyond a small on-premises company.

Employees now require access to Microsoft 365 services including:

- Outlook
- Teams
- OneDrive
- SharePoint

The IT department must integrate the existing Active Directory environment with Microsoft Entra ID while maintaining centralized identity management.

The company chooses a Hybrid Identity model, allowing users to authenticate using their existing corporate accounts.

---

# Learning Objectives

After completing this module I should be able to:

- Understand Microsoft Entra ID architecture
- Explain the differences between Active Directory and Entra ID
- Understand identity models
- Configure Hybrid Identity
- Configure User Principal Names (UPN)
- Install Microsoft Entra Connect Sync
- Synchronize identities
- Validate synchronization
- Troubleshoot synchronization issues
- Understand Soft Match and Hard Match
- Verify object synchronization
- Document the hybrid identity deployment

---

# Technologies

## On-Premises

- Windows Server 2022
- Active Directory Domain Services
- DNS

## Hybrid Identity

- Microsoft Entra ID
- Microsoft Entra Connect Sync
- Microsoft 365 Tenant

## Administration

- Microsoft Entra Admin Center
- Windows PowerShell

## Documentation

- GitHub
- Markdown
- Draw.io

---

# Module Roadmap

---

# 1. Microsoft Entra ID Fundamentals

## Objectives

- Understand Microsoft Entra ID
- Understand cloud identity
- Understand tenant architecture
- Understand authentication concepts

## Topics

- Tenant
- Directory
- Cloud Identity
- Authentication
- Authorization

## Deliverables

- Understanding of Microsoft Entra architecture

**Status**

Planned

---

# 2. Identity Models

## Objectives

Understand differences between:

- Cloud Only
- Hybrid Identity
- Federated Identity

## Deliverables

Ability to explain each identity model and choose the appropriate deployment scenario.

**Status**

Planned

---

# 3. Microsoft 365 Tenant

## Objectives

- Explore Microsoft 365 Admin Center
- Explore Microsoft Entra Admin Center
- Understand tenant configuration
- Understand default domain

## Deliverables

Basic tenant configuration completed.

**Status**

Planned

---

# 4. User Principal Name (UPN)

## Objectives

Understand:

- UPN
- Alternate UPN Suffix
- Sign-in names
- Domain suffixes

## PowerShell

- Get-ADUser
- Set-ADUser

## Deliverables

Corporate UPN suffix configured.

**Status**

Planned

---

# 5. Microsoft Entra Connect

## Objectives

- Install Entra Connect
- Configure synchronization
- Configure OU filtering
- Configure authentication method

## Deliverables

Successful synchronization configuration.

**Status**

Planned

---

# 6. Identity Synchronization

## Objectives

Understand:

- Initial Sync
- Delta Sync
- Password Hash Sync
- Synchronization cycle
- Object synchronization

## Deliverables

Successful synchronization verified.

**Status**

Planned

---

# 7. Hybrid User Lifecycle

## Objectives

Create a complete user lifecycle:

- Create user in AD
- Synchronize
- Modify properties
- Disable account
- Delete account

Observe changes in Microsoft Entra ID.

## Deliverables

Complete hybrid identity lifecycle demonstrated.

**Status**

Planned

---

# 8. Synchronization Troubleshooting

## Objectives

Understand:

- Synchronization errors
- Duplicate identities
- Soft Match
- Hard Match
- Immutable ID

## Deliverables

Basic troubleshooting completed.

**Status**

Planned

---

# 9. Microsoft Entra Administration

## Objectives

Navigate Microsoft Entra Admin Center.

Understand:

- Users
- Groups
- Devices
- Synchronization status

## Deliverables

Ability to manage synchronized identities.

**Status**

Planned

---

# 10. PowerShell

## Objectives

Use PowerShell only where appropriate for administration.

Topics include:

- Verify synchronization
- Query users
- Query groups
- Validate identities

## Deliverables

Basic administrative PowerShell skills for Hybrid Identity.

**Status**

Planned

---

# Practical Project

## Scenario

Contoso Warsaw migrates from a purely on-premises identity infrastructure to a Hybrid Identity environment.

The IT department must:

- prepare Active Directory
- configure UPN
- install Microsoft Entra Connect
- synchronize identities
- validate synchronization
- troubleshoot synchronization
- document the deployment

---

# Repository Structure

```
02-hybrid-identity-entra

│

├── Documentation

├── Scripts

├── Screenshots

├── Assets

└── README.md
```

---

# Skills Acquired

After completing this module I should be able to:

- Explain Microsoft Entra ID architecture
- Explain Hybrid Identity
- Configure UPN suffixes
- Configure Microsoft Entra Connect
- Perform directory synchronization
- Validate synchronized users
- Understand Soft Match
- Understand Hard Match
- Troubleshoot synchronization issues
- Navigate Microsoft Entra Admin Center

---

# Definition of Done

This module is considered complete when:

- Microsoft Entra tenant configured
- UPN suffix configured
- Microsoft Entra Connect installed
- Successful synchronization completed
- Test users synchronized
- Synchronization verified
- User lifecycle tested
- Basic troubleshooting completed
- Documentation completed
- Screenshots captured

---

# Current Progress

| Component | Status |
|-----------|--------|
| Entra Fundamentals | ⏳ |
| Identity Models | ⏳ |
| Microsoft 365 Tenant | ⏳ |
| UPN | ⏳ |
| Entra Connect | ⏳ |
| Synchronization | ⏳ |
| Hybrid User Lifecycle | ⏳ |
| Troubleshooting | ⏳ |
| Entra Administration | ⏳ |
| PowerShell | ⏳ |

---

# Module Outcome

Upon completion, the Contoso Warsaw environment will operate as a Hybrid Identity infrastructure.

The on-premises Active Directory will serve as the authoritative identity source while Microsoft Entra ID will provide secure cloud authentication for Microsoft 365 services.

This module establishes the identity bridge required for the next stages of the project, including Exchange Online, Microsoft Intune, Conditional Access, and Zero Trust security.