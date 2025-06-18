---
title: "Task 1: FortiGate NVA Deployment"
linkTitle: "Task 1: FortiGate NVA Deployment"
weight: 1
---

In task one, you will deploy a FortiGate NVA into the vWAN hub that you have been assigned.

1. ***Click*** on VWAN **vwanXX-training_VWAN** in your Resource Group. **XX** is your assigned number.

    ![4_1-fortigate-deployment-10](../images/4_1-fortigate-deployment-10.PNG)

1. ***Click*** on "Hubs" in the "Connectivity" section of the left-hand navigation. A hub in EastUS has already been deployed.

    ![4_1-fortigate-deployment-11](../images/4_1-fortigate-deployment-11.PNG)

1. ***Click*** on your assigned hub

1. ***View*** information about Hub

    - Name
    - Location (Region)
    - Private Address Space

1. ***Confirm*** the status of the following:

    - Hub status: **Succeeded**
    - Routing status: **Provisioned**

    ![4_1-fortigate-deployment-12](../images/4_1-fortigate-deployment-12.PNG)

    {{% notice warning %}}**Only** move on to the next step if Hub and Routing status have green checks.{{% /notice %}}

1. ***Click*** on "Network Virtual Appliance in the "Third party providers" section of the left-hand navigation.
1. ***Click*** the button "Create network virtual appliance"
1. ***Select*** fortinet-sdwan-and-ngfw
1. ***Click*** "Create" -  proceed to leave site to redirect to Marketplace.

    ![vwan4](../images/vwan4.jpg)

     {{% notice info %}}If a warning is displayed about "Leaving" the site, select the **Leave page** button.{{% /notice %}}

    ![4_1-fortigate-deployment-2](../images/4_1-fortigate-deployment-2.PNG)

1. ***Click*** "Create" on the Marketplace listing for "**Azure Virtual WAN Secured by FortiGate**"

    ![vwan5](../images/vwan5.jpg)

1. ***Click*** on "Yes, continue" on the Continue creating this plan? screen.

    ![4_1-fortigate-deployment-4](../images/4_1-fortigate-deployment-4.PNG)

1. On the "Create Azure Virtual WAN Secured by FortiGate" window, enter the following values in the **Basics** tab:

    - ***Select*** - Resource Group - **vwanXX-training** -- *Be sure to select your assigned Resource Group*
    - ***Select*** - Region - **East US** -- *May already be defaulted to the correct region*
    - ***Enter*** - FortiGate administrative username - ```fortixperts```
    - ***Enter*** - password - ```Fortixperts2024!```
    - ***Confirm*** - password - ```Fortixperts2024!```
    - ***Enter*** - FortiGate Name Prefix - **vwanXX** -- *Enter your assigned lab number for XX.*
    - ***Select*** - FortiGate License Type - "**Pay As you Go (PAYG)**"
    - ***Select*** - FortiGate Image Version - "**7.4.X**" -- *Be sure to select the highest 7.4 version.*
    - ***Select*** - Azure vWan deployment type - "**SDWAN + NGFW (Hybrid)**"
    - ***Enter*** - Application Name - **vwanXX** -- *Enter your assigned lab number for XX.*
    - ***Update*** - Managed Resource Group - Append "**_vwanXX**" to the provided name -- *Enter your assigned lab number for XX.*
    - ***Click*** - "**Next**"

    ![4_1-fortigate-deployment-3_1](../images/4_1-fortigate-deployment-3_1.PNG)

1. On the **FortiGate in Virtual WAN Specific Parameters** tab, enter the following values:

    - ***Select*** Virtual WAN Hub - select vwanXX-eastus-vHub1_VHUB -- **Be sure to enter your assigned lab number for XX.**
    - ***Checkbox*** **Enable Internet Edge Inbound Feature**
    - ***Leave*** all other items as is
    - ***Click*** "Next"

    ![4_1-fortigate-deployment-5](../images/4_1-fortigate-deployment-5.PNG)

1. On the **PublicIP Verification** tab, select "Next".

    - ***No screenshot included in the step***

1. on the **Managed Application Settings** tab, click "Add"

    ![4_1-fortigate-deployment-5_1](../images/4_1-fortigate-deployment-6_1.PNG)

1. on the **add User assigned managed identity**, 

    - ***Select*** Internal Training
    - ***Select*** **id-us-xperts-2025-public-cloud-202**
    - ***Click*** "Add"
    
    ![4_1-fortigate-deployment-5_1](../images/4_1-fortigate-deployment-6_2.PNG)
    
1. on the **Managed Application Settings** tab, make sure to verify it looks like below, click "Next"

    ![4_1-fortigate-deployment-5_1](../images/4_1-fortigate-deployment-6_3.PNG)

1. On the **Tags** tab, select "Next".

    - ***No screenshot included in this step***

1. On the **Review + create** tab, select the following:

    - ***Scroll*** down to agree to the terms and conditions
    - ***Click*** "Create"

    ![4_1-fortigate-deployment-7](../images/4_1-fortigate-deployment-7.PNG)

    {{% notice info %}}The FortiGate NVAs take about 15 minutes to deploy. Grab a refreshment and relax! You will see the screen belows when the deployment is in progress and when complete.{{% /notice %}}

    ![4_1-fortigate-deployment-8](../images/4_1-fortigate-deployment-8.PNG)

1. ***Click*** on your assigned **Resource Group** to return to your Resource Group and prepare for the next task.

    ![4_1-fortigate-deployment-9](../images/4_1-fortigate-deployment-9.PNG)

**Continue to Chapter 4 - Task 2: Configure FGSP**
