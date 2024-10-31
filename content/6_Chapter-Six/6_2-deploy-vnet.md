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

        ![vnet1](../images/vnet1.jpg)
        ![vnet2](../images/vnet2.jpg)
        ![vnet3](../images/vnet3.jpg)

    - ***Select*** - your Resource Group **vwanXX-training**
    - ***Enter*** - Virtual network name **Spoke3-vHub2_VNET**
    - ***Select*** - Region "(US) West US"
    - ***Click*** - "Next" button

        ![vnet4](../images/vnet4.jpg)

    - ***Click*** - "Next" button on "Security" tab

       ![vnet5](../images/vnet5.jpg)

    - ***Enter*** - Address Space **192.168.3.0**
    - ***Select*** - Netmask **/24**
    - ***Click*** - "Pencil" button to edit subnet configuration
    - ***Enter*** - Name **Subnet1-Spoke3_SUBNET**
    - ***Enter*** - Starting address **192.168.3.0**
    - ***Click*** - "Save" button

       ![vnet6](../images/vnet6.jpg)

        - ***Click*** - "Next" button

       ![vnet7](../images/vnet7.jpg)

        - ***Click*** - "Next" button

       ![vnet8](../images/vnet8.jpg)

        - ***Click*** - "Create" button

       ![vnet9](../images/vnet9.jpg)

        - ***Click*** - your resource group name when the deployment is complete and confirm the new "Spoke3-vHUB2_VNET".

       ![vnet10](../images/vnet10.jpg)

**Continue to Chapter 6 - Task 3: Deploy a Linux VM**
