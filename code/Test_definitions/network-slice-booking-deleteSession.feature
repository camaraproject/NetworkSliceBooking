Feature: CAMARA Network Slice Booking API v0.1.0 - Operation deleteSlice

    # Input to be provided by the implementation to the tester
    #
    # Implementation indications:
    # * apiRoot: API root of the server URL
    #
    # Testing assets:
    # * The sliceId of an existing slice.
    # * References to OAS spec schemas refer to schemas specified in network-slice-booking.yaml, version 0.1.0

  Background: Common deleteSlice setup
    Given an environment at "apiRoot"
    And the resource "/network-slice-booking/v0.1/slices/{sliceId}"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    And the path parameter "sliceId" is set by default to a existing network slice sliceId

# Success scenarios

  @network_slice_booking_deleteSlice_01_delete_existing_slice_scenario
  Scenario: Delete an existing network slice
    Given an existing network slice created by operation createSlice
    And the path parameter "sliceId" is set to the value for that network slice
    When the request "deleteSlice" is sent
    Then the response status code is 204
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"

  @network_slice_booking_deleteSlice_02_invalid_slice_id_scenario
  Scenario: Invalid Argument. Generic Syntax Exception
    Given the path parameter "sliceId" has not a UUID format
    When the request "deleteSlice" is sent
    Then the response status code is 400
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" is "Client specified an invalid argument, request body or query param."

  @network_slice_booking_deleteSlice_03_out_of_range_scenario
  Scenario: Error responses where the parameters in the request body are out of range
    Given the request body property argument are out of range
    When the request "deleteSlice" is sent
    Then the response status code is 400
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response property "$.status" is 400
    And the response property "$.code" is "OUT_OF_RANGE"
    And the response property "$.message" is "Client specified an invalid range."

  @network_slice_booking_deleteSlice_04_missing_authorization_scenario
  Scenario: Error response for no header "Authorization"
    Given the header "Authorization" is not sent
    And the request body is set to a valid request body
    When the request "deleteSlice" is sent
    Then the response status code is 401
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_deleteSlice_05_missing_access_token_scope_scenario
  Scenario: Missing access token scope
    Given the header "Authorization" is set to an access token that does not include scope network-slice-booking:slices:delete
    When the request "deleteSlice" is sent
    Then the response status code is 403
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_deleteSlice_06_resource_not_found_scenario
  Scenario: Error response for not found resouce
    Given an correct format and not existing network slice slice id
    When the request "deleteSlice" is sent
    Then the response status code is 404
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" is "The specified resource is not found."

  @network_slice_booking_deleteSlice_07_too_many_requests_scenario
  Scenario: Error response for too many requests
    Given the right request body property argument
    When the request "deleteSlice" is sent
    Then the response status code is 429
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" is "Rate limit reached."
