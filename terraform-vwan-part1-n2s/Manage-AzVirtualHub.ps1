<#
    .DESCRIPTION
        Manage Azure Virtual Hubs

    .NOTES
        AUTHOR: jmcdonough@fortinet.com
        LASTEDIT: November 10, 2024

	.Examples
		List
		./Manage-AzVirtualHub.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name lab-chile-?-training))

		List and Delete
		./Manage-AzVirtualHub.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name lab-chile-?-training)) -Delete

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
		if ($Delete) {
			Write-Host "Deleting vHub - Resource Group: $($resourceGroup.ResourceGroupName) vHub: $($vHub.Name)"
			Remove-AzVirtualHub -ResourceGroupName $resourceGroup.ResourceGroupName -Name $vhub.Name -AsJob -Force
		}
		else {
			Write-Host "vHub Resource Group: $($resourceGroup.ResourceGroupName) vHub: $($vHub.Name)"
		}
	}
}
