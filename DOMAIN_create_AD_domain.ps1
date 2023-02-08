Import-Module ActiveDirectory

# Provide Name of Domain and Admin Password
$domainName = "contoso.com"
$netbiosName = "CONTOSO"
$safemodeAdminPassword = ConvertTo-SecureString "Password1" -AsPlainText -Force

# Install Active Directory Features
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Create Active Directory Domain and Forest
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "Win2012R2" `
    -DomainName $domainName `
    -DomainNetbiosName $netbiosName `
    -ForestMode "Win2012R2" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true `
    -SafeModeAdministratorPassword $safemodeAdminPassword
