# Get today's date
$date = Get-Date -Format "yyyyMMdd_HHmmss"

# Define the location to save the event logs
$path = "C:\EventLogs_$date"

New-Item -ItemType Directory -Path $path | Out-Null

# Create a copy of each event log into the $path and then clear it.
Get-EventLog -List | ForEach-Object {
    $log = $_.LogDisplayName
    Get-EventLog -LogName $log | Export-EventLog -Path "$path\$log.evtx"
    Clear-EventLog -LogName $log
}
