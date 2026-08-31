function New-TestResourceGroup {
<#
.SYNOPSIS
Creates a new resource group in Azure.

.DESCRIPTION
This script creates a new resource group in Azure using the specified name and location.

.EXAMPLE
.\create-resourcegroup.ps1 -ResourceGroupName "MyResourceGroup" -Location "centralus"
#>

[CmdletBinding(SupportsShouldProcess=$true)]
param ( 
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateLength(1, 15)] 
    [string]$ResourceGroupName,

    [Parameter(Mandatory=$false)]
    [hashtable]$Tags = @{
        "Department" = "IT"
        "Environment" = "Test"
    }
)

Write-Verbose "Creating resource group"
Write-Debug "Resource Group Name: $ResourceGroupName"

start-transcript -path "lm1-logs.log" -append

$result = [PSCustomObject]@{
    ResourceGroupName = $ResourceGroupName
    Location          = "centralus"
    Status            = "Not Created"
    Tags              = $Tags
    Timestamp         = Get-Date
}

if ($PSCmdlet.ShouldProcess(
    "Resource Group
'$ResourceGroupName' ",
    "Create"
))
{
    #create resource group code
}

try {
    New-AzResourceGroup -Name $ResourceGroupName -Location "centralus" -Tags $Tags -ErrorAction Stop
    Write-Verbose "Resource group '$ResourceGroupName' created successfully."
    $result.Status = "Created"
} 
catch {
 "Failed to create resource group: $($_.Exception.Message)"
}
finally {
    "Script execution completed."
}

$result

stop-transcript
}