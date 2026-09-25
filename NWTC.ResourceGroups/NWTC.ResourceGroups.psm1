$publicFunctions = Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1"

foreach ($function in $publicFunctions) {
    . $function.FullName
}

$privateFunctions = Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1"

foreach ($function in $privateFunctions) {
    . $function.FullName
}


Export-ModuleMember -Function New-TestResourceGroup, Get-ResourceGroupSummary