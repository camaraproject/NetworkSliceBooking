# Network Slice Assignment (NSA) API User Story

| **Field** | Description | 
| ---- | ----- |
| API family name | Network Slicing API |
| API summary | **Overview**: There are emerging requirements in high-rate time-critical applications in the areas of Cloud-gaming, AR/VR, Live Video Streaming, Real-time Multi-Media etc through mobile networks. The on-demand network slicing service technology can provide a network slice reservation method for such scenarios to meet the SLA assurance expected by developers for a specific time period and a dedicated service area.  <br /> **Correlation with network-slice-booking API**: The Network Slice Booking API provides such abilities for OTT developers to reserve, dynamically provisioning, query, dynamically destroy a slice with customized SLA assurance capabilities, customized service duration, expected slice covered locations and so on. Network Slice Assignment API serves as a key user touchpoint in the network slicing service process, enabling OTT service providers to dynamically and in real-time bind their end-users to the network slices that have successfully reserved.This API accomplishes the final step of transformation from "activating slices for business" to "enabling users to experience slices".<br/> **Network Slice Assignment API**: It allows developers to assign/release users to/from reserved slices, as well as provides functionalities to query assigned slices through user devices and retrieve the list of users currently assigned to a reserved slice by the slice identifier.<br /><br /> Proposed API Definitions <br /> -Input Parameters:<br />Device: device identifiers (ipv4Address, ipv6Address, phoneNumber, networkAccessIdentifier)<br />SliceId: network slice Identifier<br /><br /> -Output Parameters:<br />Slice Assignment Result: device assigned to network slice success  or failure (status and reason). <br /> <br /> An example: An OTT service provider (e.g. a live streaming platform) has completed network slice reservation preparations for an upcoming live streaming event. To ensure a high-quality live streaming experience for users, the following steps need to be completed.<br />Reservation Preparation: The OTT service provider (e.g., a live streaming platform) successfully provisions a network slice with high uplink bandwidth and low-latency guarantees in advance for an upcoming "online live streaming event" through the `network-slice-booking` API, obtaining a unique `slice_id`.<br />User Trigger: Influencer Companies or studios subscribe to the "Dedicate/Premium Streaming Service" on the live streaming platform.<br />API Call: The live streaming app calls the `network-slice-assignment` API in the background to associate the terminal information (e.g., mobile number, IP address) of the influencer company/studio with the previously reserved `slice_id`.|
| Technical viability | This API requires the availability of RAN slicing, UDM, PCF, and network slicing management services as expressed in 3GPP TS 28.531 (network slice provisioning operations), TS 28.541 (Information model definitions for network slice NRM) standards.|
| Commercial viability | Network Slicing has been commercialized in many fields. Static Slicing has helped operators monetized. Dynamic Slicing is on the way of huge potential value. It’s especially valuable in influencer live video stream, new media, power fiber scenario, industry fileds, there already appear many commercial use cases.| 

## ***Summary***

There are emerging requirements in high-rate time-critical applications in the areas of Cloud-gaming, AR/VR, Live Video Streaming, Real-time Multi-Media etc through mobile networks. The on-demand network slicing service technology can provide a network slice reservation method for such scenarios to meet the SLA assurance expected by developers for a specific time period and a dedicated service area. The Network Slice Booking API provides such abilities for OTT developers to reserve, dynamically provisioning, query, dynamically destroy a slice with customized SLA assurance capabilities, customized service duration, expected slice covered locations and so on. <br /> The Network Slice Assignment API then lets them dynamically assign end-users to these reserved slices, delivering the guaranteed experience. It allows developers to assign/release users to/from reserved slices, as well as provides functionalities to query assigned slices through user devices and retrieve the list of users currently assigned to a reserved slice by the slice identifier.

## ***Scenarios - Assignment Scenario 1***

**Operators:**

Telecom provides Network Slice Assignment API for enterprise customer. Assigning slice resources to end-users enables to provide guaranteed network services.

**API Consumers:** 

OTT as API consumer. Eg: Tiktok
TitTok can Assign the ordered slice resources for end users by this API, achieving the provision of network guarantee services for its end users

**API End Users:**  

OTT Customers Eg: Tiktok Influencer Studios 

1. Influencers Companies or Studios may order "Dedicate/Premium Streaming Service" provided by Tiktok.
2. Tiktok then help Influencer Companies on binding their devices into the Slice by calling the Network Slice Assignment APIs.

## ***Scenarios - Assignment Scenario 2***

**Operators:**

Telecom provides Network Slice Assignment API for enterprise customer. Assigning slice resources to end-users enables to provide guaranteed network services.

**API Consumers:** 

Enterprises Developer. Eg: TV Station Developer

1. TV Stations usually have grand TV Live Streaming Business. They need Slice Assurance Services to assure that they have dedicated network resources for their streaming. 
2. TV Stations APP developer call Network Slice Assignment API provided by Telecom NaaS Platform/Aggregator Platform directly to make it "Streaming Assurance" function on the APP.

**API End Users:**

Video Consumer. Eg: Fans watching the game

1. Fans watching the game can order "Dedicate/Premium Streaming Service" provided by TV App.
2. Fans watching the game can Enjoy a high-definition and smooth competition experience binding their devices into the Slice by calling the Network Slice Assignment APIs.