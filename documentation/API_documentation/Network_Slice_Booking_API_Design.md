# Network Slice Booking API Design

## **Use Cases**
The business modes of Network Slice Booking can be  B2B, B2B2C. 

Note: Currently, we've come across the following business modes, which can be grouped into these 3 in general. If there's any other modes, please do not hesitate to propose. 

**1. Scenario 1 - B2B** 
    
    In brief: toB Enterprise customers come to NaaS Platform, book a slice, telecom operator provide the service.
    
    API Provided By: Telecom Operator's NaaS Platform, or Aggregator's NaaS Platform

    API Consumer: Enterprise APP Developer

    End User: toB Enterprise Customer
     
    Example Use Cases: For enterprise customers, who in the past need to talk to a customer manager, to book a slice service. Now those group of customers may renew, modify, or cancel a slice service within a NaaS Service API call.


**2. Scenario 2 - B2B2C**

    In brief: OTT abstract the slice api from NaaS Platform, provide a channel for toC individual customers, to buy a slice from NaaS Plaform.
    
    API Provided By: Telecom Operator's NaaS Platform, or Aggregator's NaaS Platform

    API Consumer: APP Developer (eg. OTT)

    Slice Product Provider: APP Developer (eg. OTT)

    End User: toC APP End Users (eg. Individuals / Influencers / Streaming Studios )

    Example Use Cases:
    - OTT call the API from any NaaS Platform, in the way of calling Network Slice Booking API. 
    - OTT abstract the API, make it a Slice Product, provided to toC customers, who are OTT APP End Users.
    - End Users buy the service through the APP.
    - OTT transfer the request to NaaS Platform. 
    - Telecom Operators provide the slice service to End Users directly.

**3. Scenario3 - B2B2C**

    In brief: OTT buy the slice from NaaS Platform, and resell the slice to toC individual customers.

    API Provided By: Telecom Operator's NaaS Platform, or Aggregator's NaaS Platform

    API Consumer: APP Developer (eg. OTT)

    API Reseller: APP Developer (eg. OTT)

    End User: toC APP End Users (eg. Individuals / Influencers / Streaming Studios )
    
    Example Use Cases: 
    - OTT book slices from any NaaS Platform, in the way of calling Network Slice Booking API. 
    - OTT may book a bunch of slices of different time and locations at one time. 
    - Telecom Operators provide slice service for OTT.
    - OTT abstract the API to an APP function, and resell the service to End Users. Resell modes depends on OTT itself.
    - End Users buy the service from OTT. 



##  **API Design**

Generally: Split the slice reservation function and device access control function
   - API 1：Reserve a slice resource 
   - API 2：Device Access Management / Manage the access control of devices to the slice 
   - Note: Basically there should be a CRUD for "Reserve a Slice Resource" and a CRUD for "Manage the access control of devices to the slice". 


**API 1：Reserve a slice resource** 
   - Function: 
     - Reserve a slice of one selected period and one selected area. 
     - Device Access Management may happen at any point in time while the resource is in revered-state and in active-state.


**API 2：Device Access Management / Manage the access control of devices to the slice**
   - Function:
     - Allow API caller manage the access control from devices to the slice.



