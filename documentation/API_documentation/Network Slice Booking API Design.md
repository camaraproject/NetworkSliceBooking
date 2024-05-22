# Network Slice Booking API Design

## **Use Cases**
The business modes of Network Slice Booking can be  B2B, B2C, B2B2C. 

Note: Currently, we've come across the following business modes, which can be grouped into these 3 in general. If there's any other modes, please do not hesitate to propose. 

1. Scenario 1 - B2B 

In Brief: Sell Slice Directly. 

Customer: toB Enterprise Customer

Seller: Operator 

Mode: Operator provide slice services by NaaS(Network as a Service) Service API to enterprise customers directly. 

Example Use Cases: For the original slice customers, who need to purchase slice from customer manager. Now those group of customer may renew, modify, or cancel a slice service with NaaS Service API call. 




2. Scenario 2 - B2C

OTT act as a Platform to Sell Slice

Customer: Individuals  / Studios / Influencers

Selling Platform: OTT

Seller: Operator

Mode: OTT only act as a platform who help provide slice to customer. 

Step1: OTT code and embed the API in the APP, provide the channel for individuals (to C) to purchase the slice. 

Step2: Individual purchase the slice from the OTT APP, pay to operators directly. 

Step3: Telecom Operator provide the slice to the individuals (to C) directly. 




3. Scenario3 - B2B2C

   OTT buy the slice, and resell the slice. 

   Customer: Individuals  / Studios / Influencers

   Seller: OTT

   Service Provider: Operator

   Mode: OTT buy the slice from Operator. OTT resell the slice to the individuals.



##  **Procedure of How to Get a Slice:**

General: Split the slice reservation function and device access control function, to fit the above 3 scenario.

   - API 1：Reserve a slice resource 
   - API 2：Manage the access control of devices to the slice

Basically there should be a CRUD for "Reserve a Slice Resource" and a CRUD for "Manage the access control of devices to the slice". 
- API 1：Reserve a slice resource 
- Function: 
  - Reserve a slice of one selected period and one selected area. 
  - Device Access Management may happen at any point in time while the resource is in revered-state and in active-state.
  - Include End Devices as optional, since: 
    - For those who would like to activate devices within 1 click, may provide the end devices infos. 
    - For those who would like to later activate devices, or don't know which devices to active when order the slice resource, may later call API2 to do activation. Suitable for B2B2C scenario.


- API 2：Manage the access control of devices to the slice
- Function:
  - Slice Owners may have the right to allow access of devices to slice between the time of the order been made till the services ends. 





