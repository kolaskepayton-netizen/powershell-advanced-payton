function New-TestResourceGroup { 
<# 
.SYNOPSIS 
Creates a new resource group in Azure. 
 
.DESCRIPTION 
This script creates a new resource group in Azure using the specified name and location. 
 
.EXAMPLE 
.\create-resourcegroup.ps1 -ResourceGroupName "MyResourceGroup" -Location "centralus" 

.EXAMPLE
New-TestResourceGroup -ResourceGroupName "Dev1"

.EXAMPLE
New-TestResourceGroup -ProjectID 1001

.EXAMPLE
"1001","1002","1003"|New-TestResourceGroup

#> 
 
[CmdletBinding(SupportsShouldProcess=$true)]  
param (   
 
    [Parameter( 
        Mandatory=$true, 
        ParameterSetName="ResourceGroupName" 
    )]  
    [ValidateLength(1, 15)]   
    [string]$ResourceGroupName, 
 
    [Parameter( 
        Mandatory=$true, 
        ParameterSetName="ProjectID", 
        ValueFromPipeline=$true 
    )] 
    [string]$ProjectID, 
  
    [Parameter(Mandatory=$false)]  
    [hashtable]$Tags = @{  
        "Department" = "IT"  
        "Environment" = "Test"  
    }  
)  
 
begin { 
    Write-Verbose "Starting function" 
   
    $TotalProcessed = 0 
    $Created = 0 
    $Skipped = 0 
    $Errors = 0
   
    Start-Transcript -Path ".\output\lm1-logs.log" -Append 

} 
 
process { 

    $TotalProcessed++
   
    Write-Verbose "Validation successful for $ResourceGroupName"
if ($PSCmdlet.ParameterSetName -eq "ProjectID") { 
    $ResourceGroupName = "RG-$ProjectID" 
} 
 
Write-Verbose "Creating resource group" 
Write-Debug "Resource Group Name: $ResourceGroupName" 
 
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
 
try { 
    Write-Verbose "Creating resource group" 
    New-AzResourceGroup -Name $ResourceGroupName -Location "centralus" -Tags $Tags -ErrorAction Stop 
    Write-Verbose "Resource group '$ResourceGroupName' created successfully." 
    $result.Status = "Created" 
    $Created++
}  
catch { 

    "Failed to create resource group: $($_.Exception.Message)" 
    $Errors++
} 
finally { 
    "Script execution completed." 
} 
 
} 
 
$result 
 
} 
 
end { 


Write-Verbose "Stopping transcript"

Write-Host "Total processed: $TotalProcessed"
Write-Host "Created: $Created"
Write-Host "Skipped: $Skipped"
Write-Host "Errors: $Errors"

stop-transcript 
 
} 
 
}