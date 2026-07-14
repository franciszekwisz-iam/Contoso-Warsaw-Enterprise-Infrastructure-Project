# 01 — Infrastructure Foundation

> Building the on-premises infrastructure required for the Contoso Warsaw enterprise environment.

---

# Module Overview

This module documents the deployment of the on-premises infrastructure that serves as the foundation for the entire Contoso Warsaw project.

At this stage the company operates exclusively on-premises without Microsoft 365 or cloud identity services.

The objective is to design and deploy a stable, scalable, and well-organized Active Directory environment that will later be integrated with Microsoft Entra ID.

---

# Business Scenario

Contoso Warsaw has just been established.

The company currently employs a small number of users but expects rapid growth over the coming months.

The IT department must prepare an enterprise-ready infrastructure capable of supporting approximately 150 employees across multiple departments and locations.

The environment should be easy to manage, secure, and ready for future hybrid identity integration.

---

# Learning Objectives

After completing this module I should be able to:

- Deploy Windows Server
- Configure Active Directory Domain Services
- Configure DNS
- Design an enterprise OU structure
- Create and manage users
- Create and manage security groups
- Understand and implement AGDLP
- Configure Group Policy
- Deploy a basic File Server
- Configure NTFS and Share permissions
- Automate common administrative tasks using PowerShell
- Document the entire implementation

---

# Technologies

Infrastructure

- Windows Server 2022
- Active Directory
- DNS
- Group Policy
- File Services

Automation

- Windows PowerShell
- ActiveDirectory Module
- CSV

Documentation

- GitHub
- Markdown
- Draw.io

---

# Module Roadmap

## 1. Infrastructure Planning

Objectives

- Server naming
- IP addressing
- Naming standards
- Domain planning

Deliverables

- Infrastructure documentation
- Naming standards
- Architecture diagram

Status

Completed

---

## 2. Windows Server Deployment

Objectives

- Install Windows Server
- Configure hostname
- Configure static IP
- Install updates

Deliverables

- W-DC01 ready for promotion

Status

Completed

---

## 3. Active Directory Domain Services

Objectives

- Install AD DS
- Promote Domain Controller
- Create forest
- Verify replication services

Deliverables

- contosowarsaw.com

Status

Completed

---

## 4. DNS

Objectives

- Verify DNS configuration
- Forward Lookup Zones
- Reverse Lookup Zones
- DNS testing

PowerShell

- Resolve-DnsName
- Get-DnsServerZone

Deliverables

- Functional enterprise DNS

Status

Planned

---

## 5. Organizational Units

Objectives

- Design enterprise OU structure
- Understand OU hierarchy
- Create production structure
- Create Sandbox OU

PowerShell

- Get-ADOrganizationalUnit
- New-ADOrganizationalUnit

Deliverables

- Enterprise OU design

Status

In Progress

---

## 6. User Administration

Objectives

- Create users manually
- Create users with PowerShell
- Import users from CSV
- Modify user properties

PowerShell

- Get-ADUser
- New-ADUser
- Set-ADUser
- Remove-ADUser

Deliverables

- Automated user provisioning

Status

Planned

---

## 7. Group Administration

Objectives

- Security Groups
- Distribution Groups
- Group Scope
- Group nesting

PowerShell

- Get-ADGroup
- New-ADGroup
- Add-ADGroupMember

Deliverables

- Enterprise group structure

Status

Planned

---

## 8. AGDLP

Objectives

- Understand AGDLP
- Design permission model
- Implement enterprise access model

Deliverables

- Standardized authorization model

Status

Planned

---

## 9. Group Policy

Objectives

- Create GPOs
- Link policies
- Password Policy
- Desktop configuration
- Drive mappings

Deliverables

- Basic enterprise policies

Status

Planned

---

## 10. File Server

Objectives

- Department folders
- Shared folders
- NTFS permissions
- Share permissions

Deliverables

- Department file shares

Status

Planned

---

## 11. PowerShell for Active Directory

Objectives

- Learn PowerShell required for AD administration
- Automate repetitive tasks
- Generate reports
- Work with CSV
- Build reusable scripts

Target Scripts

- CreateOU.ps1
- CreateUsers.ps1
- CreateGroups.ps1
- AddUsersToGroups.ps1
- ImportUsersCSV.ps1
- ADReport.ps1

Deliverables

- PowerShell toolkit for AD administration

Status

In Progress

---

## 12. Business Scenario

Scenario

Contoso Warsaw hires its first 20 employees.

Tasks

- Create departments
- Create users
- Create groups
- Apply AGDLP
- Configure permissions
- Document the deployment

Deliverables

- Fully operational on-premises environment

Status

Planned

---

# Repository Structure

```
01-infrastructure-base

│

├── Documentation

├── Scripts

├── Screenshots

├── Assets

└── README.md
```

---

# Definition of Done

This module is considered complete when:

- Windows Server deployed
- Active Directory operational
- DNS verified
- Enterprise OU structure implemented
- Users created manually
- Users automated with PowerShell
- CSV provisioning completed
- Security groups implemented
- AGDLP implemented
- Basic GPOs configured
- File Server configured
- NTFS permissions verified
- PowerShell scripts documented
- Screenshots captured
- GitHub documentation completed

---

# Current Progress

| Component | Status |
|------------|--------|
| Infrastructure Planning | ✅ |
| Windows Server | ✅ |
| Active Directory | ✅ |
| DNS | ⏳ |
| OU Design | ⏳ |
| Users | ⏳ |
| Groups | ⏳ |
| AGDLP | ⏳ |
| Group Policy | ⏳ |
| File Server | ⏳ |
| PowerShell | ⏳ |
| Business Scenario | ⏳ |