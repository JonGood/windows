# Set to threshold of days.
$days = 90

Get-LocalUser | Where-Object {$_.LastLogon -lt (Get-Date).AddDays(-$days)}

Echo " "
Echo "=========================================="
Echo " "
Echo "Over $days days since last logon."
