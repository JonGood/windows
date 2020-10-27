# PROCESS:
#  1. READ registry locations from a CSV file ($origCSV)
#  2. Retrieve configured values from the system.
#  3. Write current values into a new column in a new file ($resultsCSV)

# INSTRUCTIONS:
#  1. Modify the variable $origCSV, with your CSV file location.
#    a. The CSV must have the following column names in cells listed: A1=RegPath, B1=Key, C1=ExpectedValue
#    b. For RegPath value, you must use the path found in regedit.
#    c. For the keys, make sure to use the shortened version (HKLM, HKCU, etc.)
#  2. Modify the variable $resultsCSV, to desired results filename.
#  3. Run script.

Clear-Host

$origCSV = ".\registry_check.csv"
$resultsCSV = ".\registry_check_results.csv"

# Copy $origCSV and name the file $resultsCSV.
Copy-Item -Path $origCSV -Destination $resultsCSV

$temp = Import-Csv $resultsCSV

# Go through each line of $temp, check the registry location, and then record the key value.
ForEach ($line in $temp) { $line.CurrentValue = Get-ItemProperty $line.RegPath -Name $line.Key | findstr $line.Key }

# Write all registry values into the $resultsCSV file.
$temp | Export-Csv $resultsCSV -NoTypeInformation
