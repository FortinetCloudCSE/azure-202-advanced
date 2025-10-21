<#
    .DESCRIPTION
        Manage Azure Virtual Hubs - List/Delete

		Typically Step 4 in a sequence of scripts to clean up a VWAN deployment

		Manage in the following order:
		1. ./Manage-AzVirtualHubVnetConnection.ps1
		2. ./Manage-AzVirtualHubRoutingIntent.ps1
		3. ./Manage-AzManagedApplication.ps1
		4. ./Manage-AzVirtualHub.ps1

    .NOTES
        AUTHOR: jmcdonough@fortinet.com
        LASTEDIT: September 19, 2025

	.EXAMPLE
		List
		./Manage-AzVirtualHub.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name vwan[2-3][0-9]-training))

		List and Delete
		./Manage-AzVirtualHub.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name vwan[2-3][0-9]-training)) -Delete

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

$clientCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:ARM_CLIENT_ID, $(ConvertTo-SecureString -String $env:ARM_CLIENT_SECRET -AsPlainText -Force)

Connect-MgGraph -TenantId $env:ARM_TENANT_ID -ClientSecretCredential $clientCredentials -NoWelcome

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
