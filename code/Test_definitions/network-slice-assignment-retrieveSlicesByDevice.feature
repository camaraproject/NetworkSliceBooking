Feature: CAMARA Network Slice Assignment API vwip - Operation retrieveSlicesByDevice

	# Retrieve the list of network slices to which a device is assigned.

    # Input to be provided by the implementation to the tester
    #
	# Implementation indications:
	# * apiRoot: API root of the server URL

    # Input to be provided by the implementation to the tester
    #
	# Implementation indications:
	# * apiRoot: API root of the server URL
	# * List of device identifier types which are not supported, among: phoneNumber, ipv4Address, ipv6Address.
	# * For this version, CAMARA does not allow the use of networkAccessIdentifier, so it is considered by default as not supported.
	#
    # References to OAS spec schemas refer to schemas specified in network-slice-assignment.yaml, version 0.1.0-rc.1

  Background: Common retrieveSlicesByDevice setup
    Given an environment at "apiRoot"
    And the resource "/network-slice-assignment/vwip/retrieve-slices"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    # Properties not explicitly overwritten in the Scenarios can take any values compliant with the schema
    And the path parameter "device" is the device information to be retrieved

# Success scenarios

  @network_slice_booking_retrieveSlicesByDevice_01_generic_success_scenario
  Scenario: Retrieve the slice information bound to the device
    Given a valid testing device that has been allocated slices
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response property "$.sliceList" is an array, with each element including the slice id, service area, service time, and slice configuration information

  @network_slice_booking_retrieveSlicesByDevice_02_invalid_argument_scenario
  Scenario: Error response for invalid argument in request body
    Given the request body property argument is invalid, such as illegal character and format error
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 400
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" is "Client specified an invalid argument, request body or query param."

  @network_slice_booking_retrieveSlicesByDevice_03_out_of_range_scenario
  Scenario: Error responses where the parameters in the request body are out of range
    Given the request body property argument are out of range, for example maxNumOfDevices is a negative integer
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 400
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response property "$.status" is 400
    And the response property "$.code" is "OUT_OF_RANGE"
    And the response property "$.message" is "Client specified an invalid range."

  @network_slice_booking_retrieveSlicesByDevice_04_missing_authorization_scenario
  Scenario: Error response for no header "Authorization"
    Given the header "Authorization" is not sent
    And the request body is set to a valid request body
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 401
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_retrieveSlicesByDevice_05_missing_access_token_scope_scenario
  Scenario: Missing access token scope
    Given the header "Authorization" is set to an access token that does not include scope network-slice-assignment:devices:retrieve
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 403
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_retrieveSlicesByDevice_06_server_resource_not_found_scenario
  Scenario: Error response for not found server resouce
    Given an correct format and existing network slice id
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 404
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_retrieveSlicesByDevice_07_business_resource_not_found_scenario
  Scenario: Error response for not found bussiness resouce
    Given an correct format and not existing network slice id
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 404
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 404
    And the response property "$.code" is "IDENTIFIER_NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_retrieveSlicesByDevice_08_service_not_applicable_scenario
  Scenario: Common validations for fail scenario of area not supported
    Given the correct slice id is not supported by the service
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 422
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 422
    And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
    And the response property "$.message" is "The service is not available for the provided identifier."

  @network_slice_booking_retrieveSlicesByDevice_09_inapposite_identifier_scenario
  Scenario: Common validations for fail scenario of inapposite identifier
    Given inapposite identifier or identifier is lost
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 422
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 422
    And the response property "$.code" such as "MISSING_IDENTIFIER", "UNSUPPORTED_IDENTIFIER" and "UNNECESSARY_IDENTIFIER"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_retrieveSlicesByDevice_10_quota_exceeded_scenario
  Scenario: Error response for quota exceeded
    Given the right request body property argument
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 429
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 429
    And the response property "$.code" is "QUOTA_EXCEEDED"
    And the response property "$.message" is "Out of resource quota."

  @network_slice_booking_retrieveSlicesByDevice_11_too_many_requests_scenario
  Scenario: Error response for too many requests
    Given the right request body property argument
    When the request "retrieveSlicesByDevice" is sent
    Then the response status code is 429
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" is "Rate limit reached."
