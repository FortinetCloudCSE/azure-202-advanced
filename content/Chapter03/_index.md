---
title: "Chapter 3: Traffic Inspection"
linktitle: "Chapter 3: Traffic Inspection"
weight: 10
---

## Traffic Inspection

At this point

- Azure Virtual WAN Routing Intent and Route Tables are configured
- Azure Virtual Networks (the Spokes) are connected to the VWAN
- FortiGate BGP is configured and has learned the Spoke networks

### What's Next?

- Can traffic pass from one spoke to another?
- Can traffic pass to the Internet?
- Can response traffic from the Internet get back to the Spokes?

{{% notice info %}}
Commonly used tools **ping** and **curl** will help determine availability and reachability of devices and services.

Additionally packet sniffing in the FortGate CLI will help determine if traffic is reaching the FortiGates for inspections and forwarding to the appropriate destination.
{{% /notice %}}

Continue to ***First Task***
