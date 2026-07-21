Get-ADUser -Filter * -SearchBase "OU=Company,DC=contosowarsaw,DC=com" | ForEach-Object {
    $newUpn = "$($_.SamAccountName)@contosowarsaw.onmicrosoft.com"
    Set-ADUser -Identity $_.SamAccountName -UserPrincipalName $newUpn
}