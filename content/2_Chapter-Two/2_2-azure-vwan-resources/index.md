---
title: "Task 2: Azure vWAN Resources"
weight: 2
---

{{< figure src="2_2-azure-vwan-resources.PNG" alt="2_2-azure-vwan-resources" >}}

### Azure vWAN Resources

To configure an end-to-end virtual WAN, create the following resources:

- **Virtual WAN:** The virtual WAN resource represents a virtual overlay of your Azure network and is a collection of multiple resources. Containing links to all virtual hubs within the virtual WAN. Virtual WANs are isolated from each other and cannot contain a common hub. Virtual hubs in different virtual WANs do not communicate with each other.

- **Hub:** A virtual hub is a Microsoft-managed virtual network. The hub contains various service endpoints to enable connectivity. From on-premises network (vpnsite), connections can be made to a hub VPN gateway, connect ExpressRoute circuits to a virtual hub, or even connect mobile users to a point-to-site gateway in the virtual hub. The hub is the core of the network in a region. Multiple virtual hubs can be created in the same region.

A hub gateway is not the same as a virtual network gateway used for ExpressRoute and VPN Gateway. For example, when using Virtual WAN,  site-to-site connections are not made from on-premises sites directly to an Azure virtual network (VNET). Instead a site-to-site connection is made to the virtual hub. The traffic always goes through the hub gateway. This means that VNETs do not need their own virtual network gateway. Virtual WAN lets VNETs take advantage of scaling easily through the virtual hub and the virtual hub gateway.

- **Hub virtual network connection:** The hub virtual network connection resource is used to connect the hub seamlessly to virtual networks. One virtual network can be connected to only one virtual hub.

- **Hub-to-hub connection:** Hubs are all connected to each other in a virtual WAN. This implies that a branch, user, or VNET connected to a local hub can communicate with another branch or VNET using the full mesh architecture of the connected hubs. VNETs can also be connected within a hub transiting through the virtual hub, as well as VNETs across hubs, using the hub-to-hub connected framework.

- **Hub route table:** virtual hub routes are applied to the virtual hub route table. Multiple routes can be added to the virtual hub route table.

These resources are used to manage network traffic and route to the FortiGate NVAs.

**Continue to Chapter 2 - Task 3: FortiGate NVA Support for vWAN**
