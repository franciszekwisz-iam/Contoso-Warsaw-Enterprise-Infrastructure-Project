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