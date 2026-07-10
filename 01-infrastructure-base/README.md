# Enterprise IAM Environment Architecture - Home Lab

## 1. Core Infrastructure & Identity Foundation

This section documents the deployment of the core infrastructure layer required to host an enterprise-grade Identity and Access Management (IAM) simulation environment. The entire setup is fully isolated from the internet to mimic a secure corporate directory core.

### 1.1 Hypervisor & Network Topology
* **Hypervisor:** Oracle VirtualBox
* **Network Mode:** Internal Network
* **Network Name:** `ContosoNetwork`
* **Objective:** Complete logical isolation of the identity core. No DHCP servers are present in this segment; all addressing is strictly static.

### 1.2 Domain Controller Specification (`W-DC01`)
* **Operating System:** Windows Server 2022 Standard (Desktop Experience)
* **Compute Resources:** 2 vCPUs, 4096 MB RAM, 50 GB Storage
* **Base Software:** VirtualBox Guest Additions installed for driver stabilization.

### 1.3 Core Networking & Identity Configuration
Before provisioning any directory roles, the local network interface and system identity were statically bound:

| Parameter | Configuration Value |
| :--- | :--- |
| **IPv4 Address** | `192.168.10.10` |
| **Subnet Mask** | `255.255.255.0` |
| **Default Gateway** | *None* (Isolated Segment) |
| **Preferred DNS** | `127.0.0.1` (Loopback pointing to local DNS) |
| **Computer Name** | `W-DC01` |

### 1.4 Active Directory Domain Services (AD DS) Deployment
The environment was promoted to a new Active Directory forest using the following parameters via Server Manager:

1. **Role Provisioning:** Installed `Active Directory Domain Services` and required management features.
2. **Deployment Operation:** Added a new forest.
3. **Root Domain Name:** `contosowarsaw.com`
4. **NetBIOS Domain Name:** `CONTOSOWARSAW`
5. **Directory Services Restore Mode (DSRM):** Configured with a secure, high-entropy administrative password.
6. **DNS Delegation:** Ignored parent zone delegation warning (expected behavior for the root domain of an isolated forest).

### 1.5 Verification of Successful Deployment
* The system executed a clean reboot to commit the directory database (`NTDS.dit`).
* The local security authority now processes logons against the domain security principal: `CONTOSOWARSAW\Administrator`.