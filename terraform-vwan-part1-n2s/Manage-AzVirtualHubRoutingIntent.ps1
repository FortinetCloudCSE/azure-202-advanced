<#
    .DESCRIPTION
        Manage Azure Virtual Hub Routing Intent - List/Delete

		Typically Step 2 in a sequence of scripts to clean up a VWAN deployment

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
		./Manage-AzVirtualHubRoutingIntent.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name vwan[2-3][0-9]-training))

		List and Delete
		./Manage-AzVirtualHubRoutingIntent.ps1 -ResourceGroups @($(Get-AzResourceGroup -Name vwan[2-3][0-9]-training)) -Delete

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
	$vHubs = Get-AzVirtualHub -ResourceGroupName $resourceGroup.ResourceGroupName -ErrorAction SilentlyContinue

	foreach ($vhub in $vhubs) {
		$routingIntent = Get-AzRoutingIntent -ResourceGroupName $resourceGroup.ResourceGroupName -HubName $vHub.Name -ErrorAction SilentlyContinue
		if ($routingIntent) {
			if ($Delete) {
				Write-Host "Deleting vHub Routing Intent - Resource Group: $($resourceGroup.ResourceGroupName) vHub: $($vHub.Name) - $($routingIntent.Id)"
				Remove-azroutingIntent -ResourceId $routingIntent.Id -AsJob -Force
			}
			else {
				Write-Host "vHub Routing Intent - Resource Group: $($resourceGroup.ResourceGroupName) vHub: $($vHub.Name) - $($routingIntent.Id)"
			}
		}
	}
}
