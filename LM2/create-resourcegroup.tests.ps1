Describe "Resource Group Test" {

    It "should create a new resource group" {

        $resourceGroupName = "TestRG"
        $location = "centralus"

        # Call the script to create the resource group
        & "$PSScriptRoot\..\LM1\create-resourcegroup.ps1" -ResourceGroupName $resourceGroupName

        # Verify that the resource group was created
        $resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue

        $resourceGroup | Should -Not -BeNullOrEmpty
        $resourceGroup.Location | Should -Be $location
    }
}