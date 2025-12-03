# Network Slice Booking (NSB) API User Story

| **Field** | Description | 
| ---- | ----- |
| API family name | Network Slicing API |
| API summary | There are emerging requirements in high-rate time-critical applications in the areas of Cloud-gaming, AR/VR, Live Video Streaming, Real-time Multi-Media etc through mobile networks. The on-demand network slicing service technology can provide a network slice reservation method for such scenarios to meet the SLA assurance expected by developers for a specific time period and a dedicated service area. The Network Slicing API provides such abilities for developers to reserve, dynamically provisioning, query, dynamically destroy a slice with customized SLA assurance capabilities, customized service duration, expected slice covered locations and so on. <br /> <br /> Proposed API Definitions <br /> -Input Parameters:<br />Service Time：Start Time ~ End Time<br />Service Area：Geographical area (Point, Line, Area)<br />Guaranteed terminals：Number of terminals<br />SLA Targets：SLA KPIs (such as DL/UL Avg Throughput, Latency) <br /> <br /> -Output Parameters:<br />Slice Reservation Result： network slice reservation success (with Slice ID) or failure. <br /> <br /> An example: a developer may use this API to book a network slice with expected service time, expected service area, expected guaranteed numbers of terminals and expected SLA targets for 2 hours to 2 weeks in advance for some scheduled events like a live stream festival scheduled  in some place.|
| Technical viability | This API requires the availability of RAN slicing, UDM, PCF, and network slicing management services as expressed in 3GPP TS 28.531 (network slice provisioning operations), TS 28.541 (Information model definitions for network slice NRM) standards.|
| Commercial viability | Network Slicing has been commercialized in many fields. Static Slicing has helped operators monetized. Dynamic Slicing is on the way of huge potential value. It’s especially valuable in influencer live video stream, new media, power fiber scenario, industry fileds, there already appear many commercial use cases.| 

## ***Summary***

There are emerging requirements in high-rate time-critical applications in the areas of Cloud-gaming, AR/VR, Live Video Streaming, Real-time Multi-Media etc through mobile networks. The on-demand network slicing service technology can provide a network slice reservation method for such scenarios to meet the SLA assurance expected by developers for a specific time period and a dedicated service area. The Network Slicing API provides such abilities for developers to reserve, dynamically provisioning, query, dynamically destroy a slice with customized SLA assurance capabilities, customized service duration, expected slice covered locations and so on.

## ***Scenarios - Booking Scenario 1***

**Operators:**

Telecom Provide Network Slice Booking API, Providing enterprise customers with the ability to order network slice resources at designated times in designated areas, laying the foundation for subsequent enterprise customer service to end users.

**API Consumers:** 

OTT as API consumer. Eg: Tiktok
TitTok can order network slicing resources for a specific area at a specific time by this API, These resources lay the foundation for providing network guarantee services to end users in the future.

## ***Scenarios - Booking Scenario 2***

**Operators:**

Telecom Provide Network Slice Booking API on NaaS Platform or Aggregator Platform

**API Consumers:** 

Enterprises Developer. Eg: TV Station Developer
TV Stations APP developer call Network Slice Booking API provided by Telecom NaaS Platform/Aggregator Platform directly to order network slice resources for the TV station. It provide a resource foundation for the "Streaming Assurance" function on the APP