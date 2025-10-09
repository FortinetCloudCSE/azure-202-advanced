---
title: "Task 1: Deploy a second VWAN Hub"
linkTitle: "Task 1: Deploy a second VWAN Hub"
weight: 1
---

In this task deploy a second vWAN hub.

## Deploy a VWAN Hub

The initial vWAN hub setup was already done for you before the session. Now you will deploy a second hub in another Azure region. The hub will eventually have a Virtual Network (VNET) peered to it, with a Linux VM deployed in the VNET as well.

1. ***Add*** a VWAN Hub.

    - ***Navigate*** to your assigned vWAN **vwanXX-eastus_VWAN**
    - On the left under "Connectivity" select "Hubs".
    - ***Click*** - "+ New Hub" button

    - ***Select*** - Region "West US"
    - ***Enter*** - Name **vwanXX-westus-vHub2_VHUB** <-- Where **XX** is your assigned number.
    - ***Enter*** - Hub private address space "10.2.0.0/16"
    - ***Select*** - Virtual hub capacity "2 Routing Infrastructure Units, 3 Gbps Router, Supports 2000 VMs"
    - ***Select*** - Hub routing preference "AS Path"
    - ***Click*** - "Next: Site to Site" button

        {{< figure src="6_1-second-hub-1.PNG" alt="6_1-second-hub-1" >}}
        {{< figure src="6_1-second-hub-2.PNG" alt="6_1-second-hub-2" >}}

    - ***Click*** - "Next: Point to Site" button
    - ***Click*** - "Next: ExpressRoute" button
    - ***Click*** - "Next: Tags" button
    - ***Click*** - "Next: Review + create" button
    - ***Click*** - "Next: Create" button

        {{< figure src="hub3.png" alt="hub3" >}}
        {{< figure src="hub4.png" alt="hub4" >}}
        {{< figure src="hub5.png" alt="hub5" >}}
        {{< figure src="hub6.png" alt="hub6" >}}
        {{< figure src="6_1-second-hub-3.PNG" alt="6_1-second-hub-3" >}}

        {{% notice tip %}}A deployment progress screen will be shown followed by a deployment completion screen. Hub deployment can take up to 30 minutes. Leave this browser tab open until you confirm the deployment has completed.  Open the Azure portal in another browser tab and continue with the next task.{{% /notice %}}

        {{< figure src="hub8.png" alt="hub8" >}}
        {{< figure src="hub9.png" alt="hub9" >}}

**Continue to Chapter 6 - Task 2: Deploy a VNET**
