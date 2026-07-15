# Module 1.4 — DNS Implementation & Diagnostics (contosowarsaw.com)

## Module Status: COMPLETED / VERIFIED

### 1. Initial State & Issue Diagnosis
During the initial deployment phase of the Active Directory domain controller (`W-DC01`), running `nslookup` diagnostic commands revealed two critical network infrastructure issues:
1. **DNS Request Timeouts (2 seconds delay):** The DNS client was prioritizing the IPv6 loopback interface (`::1`) which did not have a matching configuration.
2. **`Server: UnKnown` Error:** The local DNS server could not resolve its own IP address (`192.168.10.10`). This indicated the complete absence of a Reverse Lookup Zone and missing PTR (Pointer) records in the DNS database.

---

### 2. Applied Remediation Steps

#### Step A: Network Interface Card (NIC) IP & DNS Realignment
* Configured IPv4 static properties on the primary domain controller according to Microsoft Active Directory Best Practices:
  * **Preferred DNS Server:** `192.168.10.10` (the DC's own static IP address)
  * **Alternate DNS Server:** `127.0.0.1` (IPv4 loopback for local resolution fallback)
* Reconfigured IPv6 DNS settings to automatic/default state to eliminate loopback `::1` resolution timeouts.

#### Step B: Active Directory-Integrated Reverse Lookup Zone Creation
* Launched the **DNS Manager** console (`dnsmgmt.msc`).
* Created a new **Active Directory-Integrated Primary Reverse Lookup Zone** for the `192.168.10.0/24` subnet (system zone name: `10.168.192.in-addr.arpa`).
* Secured the zone replication scope to: *"To all DNS servers running on domain controllers in this domain: contosowarsaw.com"*.
* Set Dynamic Updates to: *Allow only secure dynamic updates* (Standard AD Security Baseline).

#### Step C: Manual PTR Record Provisioning
* Created a new **Pointer (PTR)** record within the newly established `10.168.192.in-addr.arpa` zone.
* Mapped host IP address octet `10` directly to the Fully Qualified Domain Name (FQDN) of the DC: `w-dc01.contosowarsaw.com.`.

#### Step D: DNS Forwarders Configuration
* Configured external DNS Forwarders using Cloudflare's public DNS resolver IP: `1.1.1.1`.
* *Architectural Note:* Due to the isolated sandbox nature of this lab (VirtualBox host-only/internal network interface with no external routing), the DNS manager console currently displays a validation warning/error for the forwarder. This behavior is expected and correct under isolated network conditions.
![proof](image.png)
---

### 3. Verification & Diagnostic Proofs

#### Verification 1: nslookup Query (Timeout Resolved)
A standard query for the AD domain now resolves instantly without timeouts, and the local DNS server is fully identified by its FQDN:
```cmd
nslookup contosowarsaw.com
Server:  w-dc01.contosowarsaw.com
Address:  192.168.10.10

Name:    contosowarsaw.com
Address:  192.168.10.10

PowerShell Active Directory Database Verification
Queried the Active Directory-integrated database partition directly via PowerShell to verify that the PTR record was successfully registered:

PowerShell
Get-DnsServerResourceRecord -ZoneName "10.168.192.in-addr.arpa"
Output:

Plaintext
HostName                  RecordType Type       Timestamp            TimeToLive      RecordData
--------                  ---------- ----       ---------            ----------      ----------
@                         NS         2          0                    01:00:00        w-dc01.contosowarsaw.com.
@                         SOA        6          0                    01:00:00        [2][w-dc01.contosowarsaw.com.][hostmaster.contoso...
10                        PTR        12         0                    01:00:00        w-dc01.contosowarsaw.com.
Result: PTR record for octet 10 successfully maps back to w-dc01.contosowarsaw.com..

Verification 3: Domain Controller Health Audit (dcdiag)
Executed a comprehensive domain controller diagnostic test targeting DNS performance and system replication:

DOS
dcdiag /test:dns
Output:

Plaintext
Directory Server Diagnosis

Performing initial setup:
   Trying to find home server...
   Home Server = W-DC01
   * Identified AD Forest.
   Done gathering initial info.

Doing primary tests
   Testing server: Default-First-Site-Name\W-DC01
      Starting test: DNS
         DNS Tests are running and not hung. Please wait a few minutes...
         ......................... W-DC01 passed test DNS
Result: Both local DC and forest partition passed all critical Active Directory DNS verification sweeps.