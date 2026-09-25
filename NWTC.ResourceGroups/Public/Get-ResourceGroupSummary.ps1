function Get-ResourceGroupSummary {
    Get-AzResourceGroup | Select-Object ResourceGroupName, Location, Tags
}