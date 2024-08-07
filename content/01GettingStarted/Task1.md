---
title: "Task 1 - Portal Login "
menuTitle: "Task 1 - Preflight check"
weight: 5
---

## Login to Portal

1. ***Navigate*** to [Azureportal](https://portal.azure.com "Azure Portal")
1. ***Login*** with provided credentials

    ![portallogin1](../images/portallogin1.png)

1. ***Click*** "Yes" to "Stay singed in?"

    ![portallogin2](../images/portallogin2.png)

1. ***Click*** "Resource groups"

    ![portallogin3](../images/portallogin3.png)

1. ***Click*** your Resource Group named *vwanXX-training*. XX is the lab number of your allocated environment.

    ![portallogin4](../images/portallogin4.png)

1. ***View*** the already deployed resources already deployed

Before moving on to the next task, please read below:

- The assigned resource group has already been deployed with key resources of this session.

- Please review and make sure all the following resources are deployed in your resource group.
  - Virtual WAN (VWAN)
    - vwanXX-eastus_VWAN

  - Virtual Hub (VHUB)
    - vHub1-eastus_VHUB

  - Virtual Networks (VNETS)
    - Spoke1-vHub1_VNET
    - Spoke2-vHub1_VNET
    - Branch_VNET

  - Virtual Machines (VMs)
    - Linux-Spoke1-VM
    - Linux-Spoke2-VM
    - Linux-Branch-VM
    - FortiGate-Branch-VM