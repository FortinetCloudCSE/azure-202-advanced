---
title: "Task 1: East-West Network Traffic"
linkTitle: "Task 1: East-West Network Traffic"
weight: 1
---


In this task create FortiGate firewall policies to allow east-west network traffic.

### Spoke to Spoke traffic (East-West)

1. ***Ping*** between Linux Spoke VMs.

    - ***Open*** a serial console connections to each Linux Spoke VM and ping the other Spoke VM

        - Linux-Spoke1-VM - `ping 192.168.2.4`
        - Linux-Spoke2-VM - `ping 192.168.1.4`

        Linux-Spoke1-VM | Linux-Spoke2-VM
        :-:|:-:
        {{< figure src="5_1-east-west-net-traffic-1.PNG" class="zoomable" >}} | {{< figure src="5_1-east-west-net-traffic-2.PNG" class="zoomable" >}}

    Neither ping will be successful because the FortiGates are not allowing traffic from port2 to port2, even though port2 would be considered *trusted* since the traffic is all internal. This is the FortiGate's ability to micro-segment the traffic.

    However, the traffic from each VM **does reach the FortiGate**, but it is dropped. Firewall Policies are required to allow traffic to pass from port2 to port2.

1. ***View*** ping traffic from Spoke VMs reaching the FortiGates

    - ***Open*** each FortiGate in a browser tab/window
    - ***Open*** FortiGate CLI
    - ***Run*** CLI command `diagnose sniffer packet port2 'icmp' 4 0 a`
      - **4** - means: print header of packets with interface name
      - **0** - means: continuous output
      - **a** - means: absolute UTC time, yyyy-mm-dd hh:mm:ss.ms

        FortiGate 0 | FortiGate 1
        :-:|:-:
        {{< figure src="5_1-east-west-net-traffic-3.PNG" class="zoomable" >}} | {{< figure src="fgtpingdiag2.jpg" class="zoomable" >}}

    The ping traffic is only on one FortiGate, this is because the internal load balancer sends traffic from the Spokes to one of the FortiGates for inspection.

1. ***Create*** Firewall policies **on both** FortiGates to allow traffic to pass from port2 to port2 (Spoke to Spoke)

    ***NOTE:*** The FortiGates can be setup to sync configuration information. If one of the FortiGates was designated as the primary configuration supplier and the other as a secondary, any changes made to the primary would be replicated to the secondary.

    Configuration Synchronization was not enabled on the FortiGates as part of this course.

    - ***Navigate*** to "Policy & Objects"
    - ***Click*** Firewall Policy
    - ***Click*** Create new

        Attribute | Value
        -|-
        Name | `port2_to_port2`
        Incoming interface | **port2**
        Outgoing interface | **port2**
        Source | **all**
        Destination | **all**
        Schedule | **always**
        Service | **ALL**
        NAT | **disabled**
        Enable this policy | **enabled**

    - ***Click*** "OK"

      {{< figure src="firewall1.png" >}}

1. ***Ping*** between Linux Spoke VMs and confirm connectivity.
    - Linux-Spoke1-VM - `ping 192.168.2.4`
    - Linux-Spoke2-VM - `ping 192.168.1.4`


        Linux-Spoke1-VM | Linux-Spoke2-VM
        :-:|:-:
        {{< figure src="5_1-east-west-net-traffic-4.PNG" class="zoomable" >}} | {{< figure src="5_1-east-west-net-traffic-5.PNG" class="zoomable" >}}

        FortiGate 0 | FortiGate 1
        :-:|:-:
        {{< figure src="5_1-east-west-net-traffic-6.PNG" class="zoomable" >}} | {{< figure src="fgtpingdiag4.jpg" class="zoomable" >}}

**Continue to Chapter 5 - Task 2: North-South Network Traffic**
