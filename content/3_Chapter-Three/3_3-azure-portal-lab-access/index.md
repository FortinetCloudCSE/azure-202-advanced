---
title: "Task 2: Azure Portal - Lab Access"
linkTitle: "Task 2: Azure Portal - Lab Access"
weight: 2
---

## Azure Portal & Resources

The work for this session takes place in Azure and on FortiGates deployed into the Azure Virtual WAN Hub. The first step is to logon to the Azure Portal.

### Login to Azure Portal and Review Existing Resources

1. ***Navigate*** to [Azure Portal](https://portal.azure.com)
1. ***Login*** with provided credentials

    {{< figure src="portallogin1.png" alt="portallogin1" >}}

    {{< figure src="portallogin2.png" alt="portallogin2" >}}

1. ***Click*** "Yes" to "Stay singed in?"

    {{< figure src="portallogin2-5.png" alt="portallogin2-5" >}}

1. ***Click*** "Cancel" on the "Welcome to Microsoft Azure" page (if displayed)

    {{< figure src="portallogin2.jpg" alt="portallogin2" >}}

1. ***Click*** "Resource groups"

    {{< figure src="portallogin3.png" alt="portallogin3" >}}

1. ***Click*** your Resource Group named *vwanXX-training*. **XX** is the number of your allocated environment.

    {{% notice tip %}}In an Azure environment there can be many Resource Groups, use the search field to find your Resource Group.{{% /notice %}}

    {{< figure src="portallogin4.png" alt="portallogin4" >}}

1. ***View*** the already deployed resources already deployed

    {{% notice info %}}The assigned **Resource Group** has already been deployed along with the key resources for this session.{{% /notice %}}

    - **Review** and make sure all the following resources are deployed in your resource group.
      - Virtual WAN (VWAN)
        - **vwanXX-training_VWAN**
        - Virtual Hub (vhub) - This resource is visible in the vwanXX-training_VWAN page.  Navigate to **Connectivity** then **Hubs** on the left side of the page.
          - **vwanXX-eastus-vHub1_VHUB**

      - Virtual Networks (VNETs)
        - **Spoke1-vHub1_VNET**
        - **Spoke2-vHub1_VNET**

      - Virtual Machines (VMs) with disk and network interface
        - **Linux-Spoke1-VM**
        - **Linux-Spoke2-VM**

    {{< figure src="portallogin5.png" alt="portallogin5" >}}

**Continue to Chapter 4 - Securing the Azure vWAN**
