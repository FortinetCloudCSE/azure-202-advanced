---
title: "Troubleshooting commands"
linktitle: "Tools"
weight: 1
---

Here are some troubleshooting commands that will be useful during the lab. 

## FortiGate Commands

**TCPDUMP on FortiGate:**

`diagnose sniffer packet <port> <filter> 4 0 -a`

**Examples:**

-> To filter on _ping_:  

`diagnose sniffer packet any 'icmp' 4 0 -a`

-> To filter on _all_ traffic: 

`diagnose sniffer packet any none 4 0 -a`

-> To filter any traffic on port1:

`diagnose sniffer packet port1 none 4 0 -a`

**IPSEC tunnel troubleshooting:**

   `diagnose debug app ike -1`
   `diagnose debug enable`

-> To disable debug:

`diagnose debug disable`

**BGP troubleshooting**:

-> To check BGP neighbors:

`get router info bgp summary`

-> To check BGP routing table:

`get router info routing-table bgp`

-> To Troubleshoot BGP:

``` bash
diagnose ip router bgp all enable
diagnose ip router bgp level info
diagnose debug enable
```

## LINUX commands

**TCPDUMP**:

`sudo tcpdump`

**Examples:**

-> To filter on _ping_:

`sudo tcpdump icmp`
