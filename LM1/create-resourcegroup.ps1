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

Write-Verbose "Creating resource group"
Write-Debug "Resource Group Name: $ResourceGroupName"

start-transcript -path "lm1-logs.log" -append
try {
    New-AzResourceGroup -Name $ResourceGroupName -Location "centralus" -ErrorAction Stop
    Write-Verbose "Resource group '$ResourceGroupName' created successfully."
} 
catch {
 "Failed to create resource group: $($_.Exception.Message)"
}
finally {
    "Script execution completed."
}
stop-transcript