# This script will READ registry locations from a CSV file ($origCSV), check their values, and create a new CSV ($resultsCSV) with the current values in a new column.
# The original CSV is not modified.

# DO THIS:
#  -Modify the variable $origCSV, with your CSV file location.
#  -Modify the variable $resultsCSV, to name the results file.
#  -The CSV must have the following column names: RegPath, Key, ExpectedValue

# For RegPath, you must use the path found in regedit.
#  -For the root of keys, make sure to use the shortened version (HKLM, HKCU, etc.)

Clear-Host

$origCSV = ".\registry_check.csv"
$resultsCSV = ".\registry_check_results.csv"

Copy-Item -Path $origCSV -Destination $resultsCSV

$temp = Import-Csv $resultsCSV

ForEach ($line in $temp) { $line.CurrentValue = Get-ItemProperty $line.RegPath -Name $line.Key | findstr $line.Key }

$temp | Export-Csv $resultsCSV -NoTypeInformation
