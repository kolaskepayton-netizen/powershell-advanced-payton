<#
.SYNOPSIS
Writes message to a log file.

.DESCRIPTION
Create log entries for the NWTC.ResourceGroups module.

.EXAMPLE
Write-ModuleLog -Message "This is a test message." -LogFile ".\Logs\test.txt"

.NOTES
Version: 1.0.0
Module: NWTC.ResourceGroups
#>

function Write-ModuleLog {
    Param (
        [string]$Message,
        [string]$LogFile,
        [string]$Level = "INFO"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content -Path $LogFile -Value "$timestamp [$Level] $Message" -WhatIf:$false
}
