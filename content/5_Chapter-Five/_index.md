---
title: "Chapter 5: Network Traffic Management"
menuTitle: "Chapter 5: Network Traffic Management"
weight: 50
---

In chapter five, the student will start managing network traffic from spoke to spoke (East-West) and from the spoke to the Internet (North/South).  This will be accomplished by creating firewall policies on the FortiGate NVAs.

Progress Summary:

- FortiGate NVAs have been deployed and FGSP configured
- Azure Virtual Networks (the Spokes) have been peered with the vWAN hub
- BGP and Routing Intent have been configured and enabled

{{% notice info %}}
Commonly used tools **ping** and **curl** will help determine availability and reachability of devices and services.

Additionally packet sniffing in the FortGate CLI will help determine if traffic is reaching the FortiGates for inspections and forwarding to the appropriate destination.
{{% /notice %}}

**Continue to Chapter 5 - Task 1: East-West Network Traffic**
