# Contoso Warsaw — Enterprise Infrastructure & Identity Lab

> End-to-end Microsoft Enterprise Administration project simulating the design, deployment, automation, security, and long-term operation of a modern enterprise environment.

---

# Project Overview

This repository documents the complete lifecycle of building and operating a Microsoft enterprise infrastructure for a fictional company called **Contoso Warsaw**.

Rather than completing isolated laboratory exercises, this project follows a continuous business narrative where the company grows over time and the IT infrastructure evolves together with its business requirements.

Every configuration, script, policy, and document is created as part of one consistent enterprise environment.

---

# Project Goals

The objective of this project is to develop practical skills expected from a Microsoft Infrastructure / Microsoft 365 / Identity Administrator.

The project focuses on:

- Enterprise infrastructure design
- Windows Server administration
- Active Directory administration
- Hybrid Identity
- Microsoft Entra ID
- Microsoft 365 administration
- Microsoft Intune
- Enterprise Security
- PowerShell automation
- Microsoft Graph PowerShell
- Azure Identity services
- Enterprise documentation
- Operational best practices

---

# Business Scenario

Contoso Warsaw is a fictional company with approximately **150 employees** operating from two offices located in Warsaw and Kraków.

The company begins with a traditional on-premises Active Directory infrastructure and gradually expands into a hybrid Microsoft cloud environment.

Throughout the project the company grows, hires new employees, introduces cloud services, deploys managed devices, strengthens security, and automates daily administrative operations.

Every implementation is based on realistic business requirements rather than isolated technical exercises.

---

# High-Level Architecture

The environment combines traditional Microsoft infrastructure with modern cloud identity services.

```
                        Microsoft 365
                              │
                              │
                      Microsoft Entra ID
                              │
                     Entra Connect Sync
                              │
                 --------------------------
                 │                        │
         Windows Server             Azure Services
      Active Directory                   │
          DNS                            │
        File Server                Key Vault
          GPO                      Azure RBAC
                 │
          Windows Clients
```

---

# Technology Stack

## Infrastructure

- Windows Server 2022
- Active Directory Domain Services
- DNS
- Group Policy
- File Services

## Identity

- Microsoft Entra ID
- Entra Connect Sync
- RBAC
- Administrative Units
- SSPR
- Conditional Access

## Microsoft 365

- Microsoft 365 Business Premium
- Exchange Online
- Shared Mailboxes
- Distribution Groups
- Microsoft 365 Groups
- Teams (basic administration)

## Endpoint Management

- Microsoft Intune
- Compliance Policies
- Configuration Profiles
- BitLocker
- Windows Update Rings
- Windows Autopilot

## Azure

- Resource Groups
- Azure RBAC
- Key Vault
- Managed Identities
- Log Analytics (basic)

## Automation

- Windows PowerShell
- Microsoft Graph PowerShell
- Exchange Online PowerShell
- CSV Automation

## Documentation

- Git
- GitHub
- Markdown
- Draw.io

---

# Architectural Specifications

| Component | Value |
|-----------|------|
| Company | Contoso Warsaw |
| On-Premises Domain | contosowarsaw.com |
| Cloud Tenant | contosowarsaw.onmicrosoft.com |
| Primary Domain Controller | W-DC01 |
| Operating System | Windows Server 2022 |
| Hypervisor | Oracle VirtualBox |
| Primary IP | 192.168.10.10/24 |

---

# Project Roadmap

## 01 — Infrastructure Foundation

Windows Server

Active Directory

DNS

OU Design

Users

Groups

AGDLP

Group Policy

File Server

NTFS Permissions

PowerShell for Active Directory

Business onboarding scenario

---

## 02 — Hybrid Identity

Microsoft Entra ID

Entra Connect Sync

Hybrid Identity

Synchronization

RBAC

Administrative Units

Identity lifecycle

---

## 03 — Microsoft 365 Services

Exchange Online

License Management

Shared Mailboxes

Distribution Lists

Microsoft 365 Groups

Microsoft Graph PowerShell

---

## 04 — Endpoint Management

Microsoft Intune

Enrollment

Configuration Profiles

Compliance Policies

BitLocker

Windows Update Rings

Windows Autopilot

---

## 05 — Enterprise Security

Conditional Access

MFA

Break Glass Accounts

SSPR

Identity Protection

Secure Score

Security auditing

---

## 06 — Azure Identity Services

Azure RBAC

Key Vault

Managed Identities

Storage

Log Analytics

---

## 07 — Monitoring & Operations

Windows Event Logs

Entra Audit Logs

Sign-in Logs

Synchronization Monitoring

Health Checks

Operational Reporting

---

## 08 — Business Scenarios

Employee onboarding

Employee offboarding

Department expansion

Office expansion

Bulk user provisioning

License automation

Incident response

---

## 09 — Portfolio Finalization

Architecture diagrams

Complete documentation

Script optimization

Repository cleanup

Final project review

---

# Implementation Methodology

Every implementation follows exactly the same workflow.

```
Business Requirement

        ↓

Solution Design

        ↓

Manual Configuration

        ↓

PowerShell Automation

        ↓

Testing & Validation

        ↓

Documentation

        ↓

Git Commit

        ↓

Lessons Learned
```

This methodology ensures that every technology is understood before being automated.

---

# Learning Philosophy

The goal of this project is **understanding**, not copying.

Every new topic follows the same learning progression:

1. Learn the underlying concept.
2. Perform the task manually.
3. Repeat it using PowerShell.
4. Automate repetitive work.
5. Document the implementation.
6. Commit the completed work to GitHub.

Automation is introduced only after the manual process is fully understood.

---

# Repository Structure

```
01-infrastructure-base/

02-hybrid-identity-entra/

03-cloud-services-exchange/

04-endpoint-management-intune/

05-enterprise-security/

06-azure/

07-monitoring/

08-business-scenarios/

09-documentation/
```

Each module contains:

- Documentation
- PowerShell scripts
- Architecture diagrams
- Screenshots
- Lessons learned

---

# Definition of Done

A module is considered complete only when all of the following criteria are met:

- Business objective completed
- Manual implementation verified
- PowerShell automation implemented
- Validation performed
- Documentation completed
- Architecture updated
- Screenshots captured
- GitHub committed

---

# Long-Term Objective

By the end of this project the entire repository will represent a fully documented Microsoft enterprise environment demonstrating practical skills in:

- Windows Server Administration
- Active Directory
- Hybrid Identity
- Microsoft Entra ID
- Microsoft 365 Administration
- Microsoft Intune
- Azure Identity Services
- Enterprise Security
- PowerShell Automation
- Technical Documentation

The final repository is intended to serve as a professional portfolio demonstrating end-to-end Microsoft enterprise administration skills.