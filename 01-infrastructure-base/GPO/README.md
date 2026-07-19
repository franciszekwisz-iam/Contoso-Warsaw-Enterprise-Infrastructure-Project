# Group Policy (GPO)

## Module Overview

This module covers the deployment and management of **Group Policy Objects (GPO)** within the Contoso Warsaw Active Directory environment.

The objective was to understand how centralized configuration management works in an enterprise Windows domain and how administrators use GPOs to enforce security settings, standardize user environments, and automate workstation configuration.

---

# Objectives

- Understand the Group Policy architecture.
- Learn the Group Policy processing order (LSDOU).
- Create and link GPOs to Organizational Units.
- Configure User and Computer policies.
- Deploy common enterprise restrictions.
- Use Group Policy Preferences (GPP).
- Verify and troubleshoot policy application.
- Perform basic GPO administration using PowerShell.

---

# Lab Environment

Domain:

contosowarsaw.com

Domain Controller:

W-DC01

Management Tools:

- Group Policy Management Console (GPMC)
- Active Directory Users and Computers
- PowerShell
- Resultant Set of Policy (RSoP)
- Group Policy Modeling Wizard

---

# Implemented Configuration

## Domain Level

### Default Domain Policy

Configured:

- Password Policy
- Password Complexity
- Password Length
- Password Age
- Account Lockout Policy

---

## Department GPO

Created:

GPO_Workstation_Restricted

Linked to:

OU=HR

Implemented settings:

- Disable Control Panel
- Disable Command Prompt (CMD)
- Desktop restrictions
- User configuration policies

---

## Group Policy Preferences (GPP)

Configured:

- Network Drive Mapping

Example:

H:

↓

\\W-DC01\SharedHR

Configured:

- Default Network Printer

Example:

\\W-DC01\HR-Printer

Configured:

- Logon Script

Example:

welcome.bat

---

# Validation

Verified policy deployment using:

- gpupdate /force
- gpresult /r
- gpresult /h
- rsop.msc
- Group Policy Modeling Wizard

Verified:

- GPO link status
- Applied GPOs
- Inheritance
- User scope
- Computer scope

---

# PowerShell

Practiced:

Get-GPO

Get-GPInheritance

Backup-GPO

Verified GPO configuration through PowerShell.

---

# Concepts Learned

- Group Policy architecture
- LSDOU processing order
- GPO linking
- Inheritance
- Enforced
- Block Inheritance
- User Configuration
- Computer Configuration
- Group Policy Preferences
- Troubleshooting GPO deployment

---

# Skills Acquired

After completing this module I am able to:

- Design a basic Group Policy structure.
- Create and link GPOs.
- Apply policies to Organizational Units.
- Configure common enterprise user restrictions.
- Deploy network drive mappings.
- Configure logon scripts.
- Manage password policies.
- Verify policy application.
- Troubleshoot GPO deployment.
- Perform basic GPO administration using PowerShell.

---

# Definition of Done

✔ Group Policy architecture understood.

✔ GPOs created and linked.

✔ User restrictions successfully deployed.

✔ Network drive mapping configured.

✔ Logon script deployed.

✔ Password policy configured.

✔ Policy inheritance verified.

✔ Troubleshooting performed using gpresult and RSoP.

✔ Basic PowerShell administration completed.

---

