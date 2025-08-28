---
title: "Task 2: Deploy a VNET"
linkTitle: "Task 2: Deploy a VNET"
weight: 2
---

## Deploy a VNET

Azure Virtual Networks (VNET) can be peered to a vWAN hub. Once a VNET is peered to a vWAN hub, workloads in the VNET can communicate with workloads in other VNETs connected to other vWAN hubs that are part of the same vWAN.

1. ***Add*** a VNET

    - ***Navigate*** to your Resource Group **vwanXX-training**
    - ***Click*** - The Portal Menu button in the upper-left corner, sometime referred to as the hamburger button
    - ***Select*** - Virtual Networks in the left-hand navigation
    - ***Click*** - "+ Create" button

        {{< figure src="vnet1.jpg" alt="vnet1" >}}
        {{< figure src="vnet2.jpg" alt="vnet2" >}}
        {{< figure src="vnet3.jpg" alt="vnet3" >}}

    - ***Select*** - your Resource Group **vwanXX-training**
    - ***Enter*** - Virtual network name `Spoke3-vHub2_VNET`
    - ***Select*** - Region "(US) West US"
    - ***Click*** - "Next" button

        {{< figure src="vnet4.jpg" alt="vnet4" >}}

    - ***Click*** - "Next : IP addresses" button on "Security" tab

       {{< figure src="vnet5.jpg" alt="vnet5" >}}

    - ***Enter*** - Address Space `192.168.3.0`
    - ***Select*** - Netmask **/24**
    - ***Click*** - "Pencil" button to edit subnet configuration
    - ***Enter*** - Name `Subnet1-Spoke3_SUBNET`
    - ***Enter*** - Starting address `192.168.3.0`
    - ***Click*** - "Save" button

       {{< figure src="vnet6.jpg" alt="vnet6" >}}

        - ***Click*** - "Next : Tags" button

       {{< figure src="vnet7.jpg" alt="vnet7" >}}

        - ***Click*** - "Next : Review + create" button

       {{< figure src="vnet8.jpg" alt="vnet8" >}}

        - ***Click*** - "Create" button

       {{< figure src="vnet9.jpg" alt="vnet9" >}}

        - ***Click*** - your resource group name when the deployment is complete and confirm the new "Spoke3-vHUB2_VNET".

       {{< figure src="vnet10.jpg" alt="vnet10" >}}

**Continue to Chapter 6 - Task 3: Deploy a Linux VM**
