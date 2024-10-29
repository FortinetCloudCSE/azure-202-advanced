---
title: "Chapter 1: Deploy"
linktitle: "Chapter 1: Deploy"
weight: 10
---

## Deploy

### Overview of your environment

Azure Virtual WAN is a networking service that brings many networking, security, and routing functionalities together to provide a single operational interface.

Features of an Azure Virtual WAN include:

- Branch connectivity (via connectivity automation from Virtual WAN Partner devices such as SD-WAN or VPN CPE).
- Site-to-site VPN connectivity.
- Remote user VPN connectivity (point-to-site).
- Private connectivity (ExpressRoute).
- Intra-cloud connectivity (transitive connectivity for virtual networks).
- VPN ExpressRoute inter-connectivity.
- Routing, Azure Firewall, and encryption for private connectivity.

This session covers the following:

- FortiGate deployment into a VWAN Hub
- East-West Inspection between workloads in VNETs peered to the Hub
- North-South inspection between workloads in VNETs peered to the Hub and the Internet

<!--Additionally, if desired and time permits:

- Hub to Hub Connectivity - If there is more than 1.5 hours left in the session ask the instructors to deploy the resources required for this task.-->

Environment network diagram for reference:

![networkdiagram1](./images/networkdiagram.png)

Continue to ***First Task***
