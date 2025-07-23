---
title: "Task 2: North-South Network Traffic"
linkTitle: "Task 2: North-South Network Traffic"
weight: 2
---


In this task create FortiGate firewall policies to allow North-South (Spoke to Internet) network traffic.

1. ***Ping*** from the Linux Spoke VMs to the Internet

    - ***Open*** a serial console connections to each Linux Spoke VM and ping 8.8.8.8
        - Linux-Spoke1-VM - `ping 8.8.8.8`
        - Linux-Spoke2-VM - `ping 8.8.8.8`

    - Also try `wget https://www.fortinet.com`

        Neither ping nor wget will be successful because the FortiGate is not allowing traffic from port2 to port1.

        Linux-Spoke1-VM | Linux-Spoke2-VM
        :-:|:-:
        ![northsouthping1](../images/northsouthping1.jpg) | ![northsouthping2](../images/northsouthping2.jpg)

    However, the traffic from each VM **does reach the FortiGate**, but it is dropped. Firewall Policies are required to allow traffic to pass from port2 to port1, and then return back to the VM that originated the ping.

1. ***View*** ping traffic from Spoke VMs reaching the FortiGates

    - ***Open*** each FortiGate in a browser tab/window
    - ***Open*** FortiGate CLI
    - ***Run*** CLI command `diagnose sniffer packet port2 'icmp' 4 0 a`
      - **4** - means: print header of packets with interface name
      - **0** - means: continuous output
      - **a** - means: absolute UTC time, yyyy-mm-dd hh:mm:ss.ms

        In the screenshots notice how this time the ping traffic appeared on FortiGate 1

        FortiGate 0 | FortiGate 1
        :-:|:-:
        ![fgtpingdiag5](../images/fgtpingdiag5.jpg) | ![fgtpingdiag6](../images/5_2-north-south-net-traffic-1.PNG)

    The ping traffic is only on one FortiGate, this is because the internal load balancer sends traffic from the Spokes to one of the FortiGates for inspection.

1. ***View*** wget traffic with this FortiGate CLI

    - `diagnose sniffer packet port2 'host www.fortinet.com' 4 0 a`

1. ***Create*** Firewall policies **on both** FortiGates to allow traffic to pass from port2 to port1 (Spoke to Internet)

    The FortiGates can be setup to sync configuration information. If one of the FortiGates was designated as the primary configuration supplier and the other as a secondary, any changes made to the primary would be replicated to the secondary.

    Configuration Synchronization was not enabled on the FortiGates as part of this course.

    - ***Navigate*** to "Policy & Objects"
    - ***Click*** Firewall Policy
    - ***Click*** Create new

        Attribute | Value
        -|-
        Name | `port2_to_port1`
        Incoming interface | **port2**
        Outgoing interface | **port1**
        Source | **all**
        Destination | **all**
        Schedule | **always**
        Service | **ALL**
        NAT | **enabled**
        IP pool configuration | **Use Outgoing Interface Address**
        Enable this policy | **enabled**

    - ***Click*** "OK"

        ![firewall2](../images/firewall2.jpg)

1. ***Ping*** from the Linux Spoke VMs to the Internet and confirm the pings are successful
    - Linux-Spoke1-VM - `ping 8.8.8.8`
    - Linux-Spoke2-VM - `ping 8.8.8.8`

    Linux-Spoke1-VM | Linux-Spoke2-VM
    :-:|:-:
    ![northsouthping3](../images/northsouthping3.jpg) | ![northsouthping4](../images/northsouthping4.jpg)

    FortiGate 0 | FortiGate 1
    :-:|:-:
    ![fgtpingdiag7](../images/fgtpingdiag7.jpg) | ![fgtpingdiag8](../images/5_2-north-south-net-traffic-2.PNG)

**Continue to Chapter 5 - Task 3: Internet Inbound**
