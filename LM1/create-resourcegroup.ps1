<#
.SYNOPSIS
Creates a new resource group in Azure.

.DESCRIPTION
This script creates a new resource group in Azure using the specified name and location.

.EXAMPLE
.\create-resourcegroup.ps1 -ResourceGroupName "MyResourceGroup" -Location "East US"
)
#>

param ( 
    [Parameter(Mandatory=$true)] 
    [ValidateLength(1, 15)] 
    [string]$ResourceGroupName
)

$TranscriptPath = "$PSScriptRoot\logs.txt"
Start-Transcript -Path $TranscriptPath -Append
try {
    New-AzResourceGroup -Name $ResourceGroupName -Location "centralus" -ErrorAction Stop
} 
catch {
 "Failed to create resource group: $($_.Exception.Message)"
}
finally {
    "Script execution completed."
}
stop-transcript