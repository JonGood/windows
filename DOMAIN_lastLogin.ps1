$daysSinceLastLogon = 180

$Days = (get-date).adddays(-$daysSinceLastLogon)

Get-ADUser -filter {(LastLogonDate -lt $Days)} -Properties Name,SamAccountName,Enabled,LastLogonDate | select-object Name,SamAccountName,Enabled,LastLogonDate | Export-CSV -Path .\results\LastLogon_$((Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")).csv -NoTypeInformation
