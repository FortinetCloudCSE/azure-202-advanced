---
title: "Chapter 4: Securing the Azure vWAN"
menuTitle: "Chapter 4: Securing the Azure vWAN"
weight: 40
---

|                            |                                                                                                                                                                   |  
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Goal**                   | Gain Experience deploying FortiGate in VWAN                                                                                                                           |
| **Task**                   | Deploy FortiGate in VWAN and configure FGSP once deployed, test VNET to VNET and Internet connectivity, configure BGP, enable Routing Intent, and peer VNETs with the vWAN hub.
| **Validation** | FortiGate is deployed and connectivity to internet, VNET to VNET is working.  

In this chapter, navigate to the assigned vWAN hub and deploy a pair of Fortigate NVAs to secure the vWAN.  After the FortiGates have been deployed, configure FGSP, test VNET to VNET and Internet connectivity, configure BGP, enable Routing Intent, and peer VNETs with the vWAN hub.

## Overview

- Deploy FortiGate NVAs into assigned VWAN hub
- Configure FGSP on both FortiGate NVAs
- Confirm no VNET to VNET or Internet connectivity
- Configure BGP and enable Routing Intent
- Peer VNETs with the vWAN hub

After you have completed the above tasks, the diagram below is a visual representation of what you will have deployed and configured.

{{< figure src="images/1_1-az-vwan-single-hub-ra.PNG" >}}

**Continue to Chapter 4 - Task 1: - FortiGate NVA Deployment**
