Feature: CAMARA Network Slice Booking API v0.1.0 - Operation createSession

    # Input to be provided by the implementation to the tester
    #
    # Implementation indications:
    # * Min start and end dates allowed
    # * Max requested time period allowed
    # * Max size of the response(Combination of starttime, endtime requested) supported for a sync response
    # * Max size of the response(Combination of starttime, endtime requested) supported for an async response
    # * Limitations about max complexity of requested area allowed
    #
    # Testing assets:
    # * An Area within the supported area
    # * An Area outside the supported area
    # * A combination of request parameters including service area, start time, and end time, configuration information of network slicing
    #
    # References to OAS spec schemas refer to schemas specifies in network-slice-booking.yaml, version 0.1.0

  Background: Common createSession setup
    Given an environment at "apiRoot"
    And the resource "/network-slice-booking/v0.1/sessions"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    # Properties not explicitly overwritten in the Scenarios can take any values compliant with the schema
    And the request body is set by default to a request body compliant with the schema at "/components/schemas/CreateSession"

# Success scenarios

  @network_slice_booking_createSession_01_generic_success_scenario
  Scenario: Common validations for any success scenario
    Given starttime, endtime, the request body property "$.serviceArea" is set to the provided service area and the configuration of information of network slicing
    When the request "createSession" is sent
    Then the response status code is 201
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/SessionInfo"
    And the response property "$.sessionId" is a character string
    And the configuration information of user's network slice booking

  @network_slice_booking_createSession_02_invalid_argument_scenario
  Scenario: Error response for invalid argument in request body
    Given the request body property argument is invalid, such as illegal character and format error
    When the request "createSession" is sent
    Then the response status code is 400
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" is "Client specified an invalid argument, request body or query param."

  @network_slice_booking_createSession_03_out_of_range_scenario
  Scenario: Error responses where the parameters in the request body are out of range
    Given the request body property argument are out of range, for example maxNumOfDevices is a negative integer
    When the request "createSession" is sent
    Then the response status code is 400
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response property "$.status" is 400
    And the response property "$.code" is "OUT_OF_RANGE"
    And the response property "$.message" is "Client specified an invalid range."

  @network_slice_booking_createSession_04_missing_authorization_scenario
  Scenario: Error response for no header "Authorization"
    Given the header "Authorization" is not sent
    And the request body is set to a valid request body
    When the request "createSession" is sent
    Then the response status code is 401
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_createSession_05_missing_access_token_scope_scenario
  Scenario: Missing access token scope
    Given the header "Authorization" is set to an access token that does not include scope network-slice-booking:sessions:create
    When the request "createSession" is sent
    Then the response status code is 403
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @network_slice_booking_createSession_06_resource_exhaustion_scenario
  Scenario: Error response for resource exhaustion
    Given the right request body property argument
    When the request "createSession" is sent
    Then the response status code is 410
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 410
    And the response property "$.code" is "GONE"
    And the response property "$.message" is "Access to the target resource is no longer available."

  @network_slice_booking_createSession_07_area_not_support_fail_scenario
  Scenario: Common validations for fail scenario of area not supported
    Given starttime, endtime, the request body property "$.serviceArea" is set to the service area of not supported and the configuration of information of network slicing
    When the request "createSession" is sent
    Then the response status code is 422
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 422
    And the response property "$.code" is "NETWORK_SLICE_BOOKING.RESOURCES_NOT_APPLICABLE"
    And the response property "$.message" is "The request resources are not applicable for session creation."

  @network_slice_booking_createSession_08_quota_exceeded_scenario
  Scenario: Error response for quota exceeded
    Given the right request body property argument
    When the request "createSession" is sent
    Then the response status code is 429
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 429
    And the response property "$.code" is "QUOTA_EXCEEDED"
    And the response property "$.message" is "Out of resource quota."

  @network_slice_booking_createSession_09_too_many_requests_scenario
  Scenario: Error response for too many requests
    Given the right request body property argument
    When the request "createSession" is sent
    Then the response status code is 429
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" is "Rate limit reached."
