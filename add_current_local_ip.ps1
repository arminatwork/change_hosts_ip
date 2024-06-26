# By Tom Chantler - https://tomssl.com/2019/04/30/a-better-way-to-add-and-remove-windows-hosts-file-entries/

param([string]$Hostname , [bool]$CheckHostnameOnly = $false)

if ([string]::IsNullOrEmpty($Hostname)) {
    throw Write-Host "Please give me Hostname dude...`nSend Hostname by '-Hostname' argument" -ForegroundColor Blue
}

#Requires -RunAsAdministrator

# Adds entry to the hosts file.
$hostsFilePath = "$($Env:WinDir)\System32\Drivers\etc\hosts"
$hostsFile = Get-Content $hostsFilePath

$DesiredIP = (Get-NetIPAddress | Where-Object { $_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00" }).IPAddress

[string]$ComputerName = $env:COMPUTERNAME

Write-Host "adding '$desiredIP' IP to '$Hostname' Hostname for '$ComputerName' to hosts file" -ForegroundColor Blue

$escapedHostname = [Regex]::Escape($Hostname)
$patternToMatch = If ($CheckHostnameOnly) { ".*\s+$escapedHostname.*" } Else { ".*$DesiredIP\s+$escapedHostname.*" }
If (($hostsFile) -match $patternToMatch) {
    Write-Host $desiredIP.PadRight(12, " ") "Hostname: $Hostname - not adding; already in hosts file" -ForegroundColor DarkYellow
} 
Else {
    Write-Host IP: $desiredIP.PadRight(12, " ") "Hostname: $Hostname - adding to hosts file... " -ForegroundColor Yellow
    Add-Content -Encoding UTF8 $hostsFilePath ("`n$DesiredIP".PadRight(12, " ") + " $Hostname")
    Write-Host "Done" -ForegroundColor Green
}