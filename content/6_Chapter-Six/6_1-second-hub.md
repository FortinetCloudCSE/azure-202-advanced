---
title: "Task 1: Deploy a second VWAN Hub"
linkTitle: "Task 1: Deploy a second VWAN Hub"
weight: 1
---

In this task, the student will deploy a second vWAN hub.

## Deploy a VWAN Hub

The initial vWAN hub setup was already done for you before the session. Now you will deploy a second hub in another Azure region. The hub will eventually have a Virtual Network (VNET) peered to it, with a Linux VM deployed in the VNET as well.

1. ***Add*** a VWAN Hub.

    - ***Navigate*** to your assigned vWAN **vwanXX-eastus_VWAN**
    - On the left under "Connectivity" select "Hubs".
    - ***Click*** - "+ New Hub" button

    - ***Select*** - Region "West US"
    - ***Enter*** - Name **vwan12-westus-vHub2_VHUB**
    - ***Enter*** - Hub private address space "10.2.0.0/16"
    - ***Select*** - Virtual hub capacity "2 Routing Infrastructure Units, 3 Gbps Router, Supports 2000 VMs"
    - ***Select*** - Hub routing preference "AS Path"
    - ***Click*** - "Next: Site to Site" button

        ![6_1-second-hub-1](../images/6_1-second-hub-1.PNG)
        ![6_1-second-hub-2](../images/6_1-second-hub-2.PNG)

    - ***Click*** - "Next: Point to Site" button
    - ***Click*** - "Next: ExpressRoute" button
    - ***Click*** - "Next: Tags" button
    - ***Click*** - "Next: Review + create" button
    - ***Click*** - "Next: Create" button

        ![hub3](../images/hub3.jpg)
        ![hub4](../images/hub4.jpg)
        ![hub5](../images/hub5.jpg)
        ![hub6](../images/hub6.jpg)
        ![6_1-second-hub-3](../images/6_1-second-hub-3.PNG)

        {{% notice tip %}}A deployment progress screen will be shown followed by a deployment completion screen. Hub deployment can take up to 20 minutes. Leave this browser tab open until you confirm the deployment has completed.  Open the Azure portal in another browser tab and continue with the next task.{{% /notice %}}

        ![hub8](../images/hub8.jpg)
        ![hub9](../images/hub9.jpg)

**Continue to Chapter 6 - Task 2: Deploy a VNET**
