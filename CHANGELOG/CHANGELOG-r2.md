# Changelog NetworkSliceBooking

<!-- TOC:START -->
## Table of Contents
- **[r2.3](#r23)**
- [r2.2](#r22)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r2.3

## Release Notes

This public release contains the definition and documentation of
* network-slice-booking 0.2.0
* network-slice-assignment 0.1.0

The API definition(s) are based on
* Commonalities 0.8.0
* Identity and Consent Management 0.5.0

## network-slice-booking 0.2.0

**network-slice-booking 0.2.0 is the second public version of the Network Slice Booking API.**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.3/code/API_definitions/network-slice-booking.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.3/code/API_definitions/network-slice-booking.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NetworkSliceBooking/blob/r2.3/code/API_definitions/network-slice-booking.yaml)

### Added

* Align with Commonalities r4.3 - Add mandatory templates and fix schemas in [#130](https://github.com/camaraproject/NetworkSliceBooking/pull/130)
* Add maxLength requirement applies to all string properties in [#108](https://github.com/camaraproject/NetworkSliceBooking/pull/108)

### Changed

* Rename the term "session" to "slice" for clarity in [#87](https://github.com/camaraproject/NetworkSliceBooking/pull/87)
* Split 422 SERVICE_NOT_APPLICABLE error into SERVICE_AREA_NOT_SUPPORTED and RESOURCES_INSUFFICIENT for better problem understanding in [#92](https://github.com/camaraproject/NetworkSliceBooking/pull/92)
* Change the callback request body schema from CloudEvent to ApiNotificationEvent aligning with Commonalities r4.2 in [#108](https://github.com/camaraproject/NetworkSliceBooking/pull/108)
* Update API definitions with corrected defaults and schema constraints aligning with Commonalities r4.2 in [#116](https://github.com/camaraproject/NetworkSliceBooking/pull/116)
* Replace inline CloudEvent + sink-credential schemas and inline area / geometry schemas with $refs into CAMARA_event_common.yaml in [#120](https://github.com/camaraproject/NetworkSliceBooking/pull/120)

### Removed

* Remove the local schema definitions for CloudEvent, sink-credential, area and geometry in favor of $refs into CAMARA_event_common.yaml in [#120](https://github.com/camaraproject/NetworkSliceBooking/pull/120)

## network-slice-assignment 0.1.0

**network-slice-assignment 0.1.0 is the initial public version of the Network Slice Assignment API.**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.3/code/API_definitions/network-slice-assignment.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.3/code/API_definitions/network-slice-assignment.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NetworkSliceBooking/blob/r2.3/code/API_definitions/network-slice-assignment.yaml)

### Added

* Initial public definition of the Network Slice Assignment API, which lets an API consumer manage the devices that use a booked network slice:
  * Assign a device to a network slice
  * Get the devices assigned to a network slice
  * Release a device from a network slice
  * Retrieve all network slices for a given device
  * Receive a notification when a device assignment changes

**Full Changelog**: https://github.com/camaraproject/NetworkSliceBooking/compare/r1.2...r2.3

# r2.2

## Release Notes

This release candidate contains the definition and documentation of
* network-slice-booking 0.2.0-rc.2
* network-slice-assignment 0.1.0-rc.2

The API definition(s) are based on
* Commonalities 0.8.0-rc.2
* Identity and Consent Management 0.5.0

## network-slice-booking 0.2.0-rc.2

**network-slice-booking 0.2.0-rc.2 is the second release-candidate of the Network Slice Booking API to align with Commonalities r4.2.**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.2/code/API_definitions/network-slice-booking.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.2/code/API_definitions/network-slice-booking.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NetworkSliceBooking/blob/r2.2/code/API_definitions/network-slice-booking.yaml)

### Added

* Add maxLength requirement applies to all string properties in https://github.com/camaraproject/NetworkSliceBooking/pull/108
* Add maxItems requirement for array properties, maximum requirement for object properties and description for all properties in https://github.com/camaraproject/NetworkSliceBooking/pull/116

### Changed

* Change the callback requestbody schema changes from CloudEvent to ApiNotificationEvent aligning with commonalities r4.2 in https://github.com/camaraproject/NetworkSliceBooking/pull/108
* Modify the apiRoot path to `http://localhost:9091` in https://github.com/camaraproject/NetworkSliceBooking/pull/116
* Replace inline CloudEvent + sink-credential schemas and inline area / geometry schemas with $refs into CAMARA_event_common.yaml in https://github.com/camaraproject/NetworkSliceBooking/pull/120

## network-slice-assignment 0.1.0-rc.2

**network-slice-assignment 0.1.0-rc.2 is the second release-candidate of the Network Slice Assignment API to align with Commonalities r4.2.**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.2/code/API_definitions/network-slice-assignment.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r2.2/code/API_definitions/network-slice-assignment.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NetworkSliceBooking/blob/r2.2/code/API_definitions/network-slice-assignment.yaml)

### Added

* Add maxLength requirement applies to all string properties in https://github.com/camaraproject/NetworkSliceBooking/pull/108
* Add maxItems requirement for array properties, maximum requirement for object properties and description for all properties in https://github.com/camaraproject/NetworkSliceBooking/pull/116

### Changed

* Change the callback requestbody schema changes from CloudEvent to ApiNotificationEvent aligning with commonalities r4.2 in https://github.com/camaraproject/NetworkSliceBooking/pull/108
* Modify the apiRoot path to `http://localhost:9091` in https://github.com/camaraproject/NetworkSliceBooking/pull/116
* Replace inline CloudEvent + sink-credential schemas and inline area / geometry schemas with $refs into CAMARA_event_common.yaml in https://github.com/camaraproject/NetworkSliceBooking/pull/120

**Full Changelog**: https://github.com/camaraproject/NetworkSliceBooking/compare/r2.1...r2.2

