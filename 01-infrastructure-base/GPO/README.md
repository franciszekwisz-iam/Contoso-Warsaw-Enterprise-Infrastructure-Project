# Active Directory: Centralized Management via GPO (Project Contoso)

## 📌 Project Overview
This module focuses on implementing centralized identity and access management policies using **Group Policy Objects (GPO)** within a local Active Directory environment (`contosowarsaw.com`). The goal was to enforce the least privilege principle and automate resource provisioning for specific organizational units (OUs).

---

## 🏗️ Active Directory & OU Architecture

The environment uses a multi-layered structure to granularly apply policies depending on business roles, strictly adhering to the **LSDOU** (Local, Site, Domain, OU) inheritance hierarchy.

```text
contosowarsaw.com (Domain)
└── SandboxOU (Organizational Unit)
    └── Sandbox_HR (Organizational Unit)
        └── [Target Users & Computers]
🛠️ GPO Implementation: GPO_Workstation_Restricted
A dedicated policy object was created and linked directly to the Sandbox_HR OU to secure workstations and provision necessary resources automatically upon user login.

1. Workstation Hardening (User Configuration)
Control Panel & Settings Restriction:

Path: User Configuration -> Policies -> Administrative Templates -> Control Panel

Setting: Prohibit access to Control Panel and PC settings -> Enabled

Impact: Prevents standard users from modifying system-level settings.

Command Prompt CLI Restriction:

Path: User Configuration -> Policies -> Administrative Templates -> System

Setting: Prevent access to the command prompt -> Enabled

Impact: Blocks access to cmd.exe execution for standard interactive sessions.

2. Resource Provisioning (Group Policy Preferences - GPP)
Network Drive Mapping (HR Share):

Path: User Configuration -> Preferences -> Windows Settings -> Drive Maps

Configuration: Action: Create | Location: \\W-DC01\SharedHR | Letter: H:

Network Printer Deployment:

Path: User Configuration -> Preferences -> Control Panel Settings -> Printers

Configuration: Shared Printer | Path: \\W-DC01\HR-Printer | Set as Default: True

3. Automation Scripts (Logon Script)
Path: User Configuration -> Policies -> Windows Settings -> Scripts (Logon/Logoff) -> Logon

File: welcome.bat (Stored securely in the domain SYSVOL share)

Payload:

DOS
@echo off
msg * Witaj w strukturze Contoso HR!
🔍 Verification & Troubleshooting (IAM Toolkit)
To ensure high availability and proper policy enforcement without disrupting production, advanced validation techniques were used:

1. Group Policy Modeling (Simulation)
Generated simulated policy results via gpmc.msc (Group Policy Modeling Wizard).

Resolved the standard MMC security warning by bypassing the about:security_mmc.exe restriction.

Result Matrix:

Applied GPOs: GPO_Workstation_Restricted (Successfully processed).

Security Filtering: Verified correct target matching for the user container contosowarsaw.com/SandboxOU/Sandbox_HR.

2. PowerShell Infrastructure Validation
Automated verification scripts were executed on the Domain Controller (W-DC01) to validate the replication and link state:

PowerShell
# 1. Check GPO core metadata and GUID status
Get-GPO -Name "GPO_Workstation_Restricted"

# 2. Verify inheritance and active links for the HR organizational unit
Get-GPInheritance -Target "OU=Sandbox_HR,OU=SandboxOU,DC=contosowarsaw,DC=com"
💡 Key Architectural Takeaways for Interviews
The Password Policy Exception: While the LSDOU rule states that policies linked closer to the object (OU level) override higher levels (Domain level), standard Password Policies are a hardcoded exception in Active Directory. They must be applied at the root of the domain (Default Domain Policy) to take effect for domain accounts, unless Fine-Grained Password Policies (FGPP) are explicitly configured.

User vs. Computer Context: Applied settings operate strictly in the User Context, ensuring that restrictions follow the identity regardless of which domain-joined hardware they utilize.