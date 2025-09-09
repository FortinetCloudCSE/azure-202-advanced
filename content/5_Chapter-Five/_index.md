---
title: "Chapter 5: Network Traffic Management"
menuTitle: "Chapter 5: Network Traffic Management"
weight: 50
---
|                            |                                                                                                                                                                   |  
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Goal**                   | Gain Experience with managing traffic on FortiGate's in VWAN                                                                                                                            |
| **Task**                   | Manage network traffic from spoke to spoke (East-West) and from spoke to the Internet (North/South) with firewall policies
| **Validation** | Firewall policies are configured and traffic flows as expected.   


In this chapter manage network traffic from spoke to spoke (East-West) and from spoke to the Internet (North/South).  This will be accomplished by creating firewall policies on the FortiGate NVAs.

Progress Summary:

- FortiGate NVAs have been deployed and FGSP configured
- Azure Virtual Networks (the Spokes) have been peered with the vWAN hub
- BGP and Routing Intent have been configured and enabled

{{% notice info %}}
Commonly used tools **curl**, **ping** and **wget** can help determine availability and reachability of devices and services.

Additionally packet sniffing in the FortGate CLI can help determine if traffic is reaching the FortiGates for inspections and forwarding to the appropriate destination.
{{% /notice %}}

**Continue to Chapter 5 - Task 1: East-West Network Traffic**
