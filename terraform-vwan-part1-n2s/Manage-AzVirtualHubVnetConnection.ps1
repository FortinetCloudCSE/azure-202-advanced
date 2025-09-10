<#
    .DESCRIPTION
        Manage Azure Virtual Hub Vnet Connections  - List/Delete

		Typically Step 1 in a sequence of scripts to clean up a VWAN deployment

		Manage in the following order:
		1. ./Manage-AzVirtualHubVnetConnection.ps1
		2. ./Manage-AzVirtualHubRoutingIntent.ps1
		3. ./Manage-AzManagedApplication.ps1
		4. ./Manage-AzVirtualHub.ps1

    .NOTES
        AUTHOR: jmcdonough@fortinet.com
        LASTEDIT: September 4, 2025

	.Examples
		List
		./Manage-AzVirtualHubVnetConnection.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name vwan[2-3][0-9]-training))

		List and Delete
		./Manage-AzVirtualHubVnetConnection.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name vwan[2-3][0-9]-training)) -Delete

		Get-AzResourceGroup -Name <-- supports regex
		The regex in the example above will get resource groups named vwan20-training, vwan21-training, ..., vwan39-training
#>

param(
	[CmdletBinding()]

	[Parameter(Mandatory = $true)]
	[Array] $ResourceGroups,

	[Parameter(Mandatory = $false)]
	[switch] $Delete
)

foreach ($resourceGroup in $ResourceGroups) {
	$vHubs = Get-AzVirtualHub -ResourceGroupName $resourceGroup.ResourceGroupName

	foreach ($vhub in $vhubs) {
		$vhubVnetConnections = Get-AzVirtualHubVnetConnection -ResourceGroupName $resourceGroup.ResourceGroupName -ParentResourceName $vHub.Name -ErrorAction SilentlyContinue
		if ($vhubVnetConnections) {
			foreach ($vhubVnetConnection in $vhubVnetConnections) {
				if ($Delete) {
					Write-Host "Deleting vHub vnet connection - Resource Group: $($resourceGroup.ResourceGroupName) vHub: $($vHub.Name) - $($vhubVnetConnection.Name)"
					Remove-AzVirtualHubVnetConnection -ResourceGroupName $resourceGroup.ResourceGroupName -ParentResourceName $vHub.Name -Name $vhubVnetConnection.Name -AsJob -Force
				}
				else {
					Write-Host "vHub vnet connection Resource Group: $($resourceGroup.ResourceGroupName) vHub: $($vHub.Name) - $($vhubVnetConnection.Name)"
				}
			}
		}
	}
}
