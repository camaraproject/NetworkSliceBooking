# Network Slice Booking API Design

## **Use Cases**
Scenario can be  B2B, B2C, B2B2C

1. Scenario 1 - B2B

   Sell Slice Directly

Customer: toB Enterprise Customer

Seller: Operator 

Mode: Operator provide slice services by NaaS API to enterprise customers directly. 

Example Use Cases: In the past/current, most of  current slice customer need to order slice from operators directly through operator customer managemer. This takes time from 2 weeks to 2 month. Those kind of customers may renew, reopen, modify, close the slice service using NaaS Slice APIs. 




2. Scenario 2 - B2C

OTT act as a Platform to Sell Slice

Customer: Individuals  / Studios / Influencers

Selling Platform: OTT

Seller: Operator

Mode: OTT only act as a platform who help provide slice to customer. 

Step1: OTT code and embed the API in the APP, provide the channel for individuals (to C) to purchase the slice. 

Step2: Individual purchase the slice from the OTT APP, pay to operators directly. 

Step3: Provider provide the slice to the individuals (to C) directly. 



3. Scenario3 - B2B2C

   OTT buy the slice, and resell the slice. 

   Customer: Individuals  / Studios / Influencers

   Seller: OTT

   Service Provider: Operator

   Mode: OTT buy the slice from Operator. OTT resell the slice to the individuals.



##  **Procudure of How to Get a Slice:**

General: Split the slice reservsation function and device access control function, to fit the above 3 scenario.

   - API 1：Reserve a slice resource 
   - API 2：Manage the access control of devices to the slice

Basically there should be a CRUD for "Reserve a Slice Resource" and a CRUD for "Manage the access control of devices to the slice". 
- API 1：Reserve a slice resource 
- Function: 
  - Reserve a slice of one selected period and one selected area. 
  - Include End Devices as optional. 
    - For those who would like to activate devices within 1 click, may provide the end devices infos. 
    - For those who would like to later activate devices, or don't know which devices to active when order the slice resource, may later call API2 to do activation. Suitable for B2B2C scenario.

- API 2：Manage the access control of devices to the slice
- Function:
  - Slice Owners may have the right to allow access of devices to slice between the time of the order been made till the services ends. 





