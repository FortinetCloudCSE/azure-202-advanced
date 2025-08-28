---
title: "Task 5: Manage Network Traffic Between Hubs"
linkTitle: "Task 5: Manage Network Traffic Between Hubs"
weight: 5
---


In this task create FortiGate firewall policies to allow or deny selective east-west network traffic between spokes in different vWAN hubs.

Create the following addresses and firewall policies **on both** FortiGates.

1. ***Create*** firewall addresses for Spoke1-vHub1_VNET, Spoke2-vHub1_VNET, and Spoke3-vHub2_VNET.

    - Login to both FortiGate NVAs
    - ***Navigate*** to "Policy & Objects"
    - ***Select***  "Addresses"
    - ***Click*** "+ Create new"
    - ***Name***  `Spoke1-vHub1_VNET`
    - ***Interface***: port2
    - ***IP/Netmask***:  `192.168.1.0/24`
    - ***Click*** OK

    {{< figure src="6_5-manage-net-hubs-1.PNG" alt="6_5-manage-net-hubs-1" >}}
    {{< figure src="6_5-manage-net-hubs-2.PNG" alt="6_5-manage-net-hubs-2" >}}

1. ***Follow*** the above steps to create these addresses on port2

   - `Spoke2-vHub1_VNET` - `192.168.2.0/24`
   - `Spoke3-vHub2_VNET` - `192.168.3.0/24`

   - FortiGate CLI for the Addresses

        ```basic
        config firewall address
            edit "Spoke1-vHub1_VNET"
                set associated-interface "port2"
                set subnet 192.168.1.0 255.255.255.0
            next
            edit "Spoke2-vHub1_VNET"
                set associated-interface "port2"
                set subnet 192.168.2.0 255.255.255.0
            next
            edit "Spoke3-vHub2_VNET"
                set associated-interface "port2"
                set subnet 192.168.3.0 255.255.255.0
            next
        end
        ```

    {{< figure src="6_5-manage-net-hubs-3.PNG" alt="6_5-manage-net-hubs-3" >}}

1. ***Create*** firewall policy to allow traffic to pass from Spoke1 to Spoke3 on **both FortiGates**.

    {{% notice warning %}}**Delete the existing port2_to_port2 policy first!**{{% /notice %}}

    - ***Click*** Firewall Policy
    - ***Click*** "+ Create new"

        Attribute | Value
        -|-
        Name | `Spoke1_to_Spoke3`
        Incoming interface | **port2**
        Outgoing interface | **port2**
        Source | **Spoke1-vHub1_VNET**
        Destination | **Spoke3-vHub2_VNET**
        Schedule | **always**
        Service | **ALL**
        NAT | **disabled**
        Enable this policy | **enabled**

    - ***Click*** "OK"

    {{< figure src="6_5-manage-net-hubs-4.PNG" alt="6_5-manage-net-hubs-4" >}}
    {{< figure src="6_5-manage-net-hubs-5.PNG" alt="6_5-manage-net-hubs-5" >}}

1. ***Follow*** the above steps to create these firewall policies on **both FortiGates**.

    - Deny traffic from Spoke2 to Spoke3
    - Allow traffic from Spoke3 to both Spoke1 and Spoke2

    - FortiGate CLI

        ```basic
        config firewall policy
            edit 0
                set name "Spoke1_to_Spoke3"
                set srcintf "port2"
                set dstintf "port2"
                set action accept
                set srcaddr "Spoke1-vHub1_VNET"
                set dstaddr "Spoke3-vHub2_VNET"
                set schedule "always"
                set service "ALL"
            next
            edit 0
                set name "deny_Spoke2_to_Spoke3"
                set srcintf "port2"
                set dstintf "port2"
                set action deny
                set srcaddr "Spoke2-vHub1_VNET"
                set dstaddr "Spoke3-vHub2_VNET"
                set schedule "always"
                set service "ALL"
                set logtraffic disable
            next
            edit 0
                set name "Spoke3_to_Spoke1_and_Spoke2"
                set srcintf "port2"
                set dstintf "port2"
                set action accept
                set srcaddr "Spoke3-vHub2_VNET"
                set dstaddr "Spoke1-vHub1_VNET" "Spoke2-vHub1_VNET"
                set schedule "always"
                set service "ALL"
            next
        end
        ```

1. ***Test*** connectivity between Linux spoke VMs.

    - ***Open*** serial console connections on each Linux VM and ping the other spoke VMs
        - Linux-Spoke1-VM -> Linux-Spoke3-VM - `ping 192.168.3.4`
        - Linux-Spoke2-VM -> Linux-Spoke3-VM - `ping 192.168.3.4`
        - Linux-Spoke3-VM -> Linux-Spoke1-VM - `ping 192.168.1.4`
        - Linux-Spoke3-VM -> Linux-Spoke2-VM - `ping 192.168.2.4`

Did you get the results you expected?  If you did, great job!.  You are done with the course.

If you did not, here are some helpful troubleshooting hints:

- Did you enter the addresses and firewall policies on both FortiGates?
- Double check your firewall policies.  Make sure NAT is disabled.
- Make sure the address names have the correct IP addresses/subnet.
- Check your route table on the FortiGates.  Do you still see all three VNETs listed?

If you checked all the above and you are still not getting the expected results, reach out to an instructor.

**Thanks for attending!**
