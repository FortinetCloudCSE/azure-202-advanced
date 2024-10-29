---
title: "Chapter 3 - Branch connectivity "
chapter: false
linktitle: "Chapter 3: Branch Connectivity"
weight: 30
---

In this section we will be going over the Branch to Azure IPSEC tunnels and bgp Configuration. 

In this section you have two options:

1. Show off your skill set by configuring the VPN tunnels to NVA1 and NVA2 on your own. To help you get started we suggest the following steps to be done in the order.

        a. Build VPN phase1 and Phase2 Tunnels
        b. Configure the static route. (Hint: BGP neighbors)
        c. Configure the firewall policies. (Hint: VPN Tunnel establishment)
        d. Configure appropriate BGP settings. 
        e. Confirm routing tables on the branch fortigate, NVA's and Hub. 
        f. Test ping connectivity between Linux-Branch_VM and Linux-Spoke1_VM
        g. Test ping connectivity between Linux-Branch_VM and Linux-Spoke2_VM
