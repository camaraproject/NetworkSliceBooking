# Changelog Network Slice Booking

## Table of Contents
- [r1.1](#r1.1)
- [r1.2](#r1.2)


**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r1.2
## Release note:
This release contains the definition and documentation of

- network-slice-booking v0.1.0

The API definition(s) are based on

- Commonalities v0.6.0
- Identity and Consent Management v0.4.0
## network-slice-booking v0.1.0

**network-slice-booking v0.1.0 is first public release version of the network-slice-booking API**

### Changed
* Fix megalinter issues in [#71](https://github.com/camaraproject/NetworkSliceBooking/pull/71) 
* Fix trailing-spaces issues in [#73](https://github.com/camaraproject/NetworkSliceBooking/pull/73)
* Align the error name to Generic429 and change mandatory description for date-time string format in [#75](https://github.com/camaraproject/NetworkSliceBooking/issues/75)
### Added
* Add centralized linting workflows to ensure code quality and API specification compliance in [#69](https://github.com/camaraproject/NetworkSliceBooking/pull/69)
* Add text description for duration format fields in [#75](https://github.com/camaraproject/NetworkSliceBooking/issues/75)
**Full Changelog**: https://github.com/camaraproject/NetworkSliceBooking/commits/r1.2

# r1.1
## Release note:
This release contains the definition and documentation of

- network-slice-booking v0.1.0-rc.1

The API definition(s) are based on

- Commonalities v0.6.0
- Identity and Consent Management v0.4.0
## network-slice-booking v0.1.0-rc.1

**network-slice-booking v0.1.0-rc.1 is first pre-release version of the network-slice-booking API**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r1.1/code/API_definitions/NetworkSliceBooking.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NetworkSliceBooking/r1.1/code/API_definitions/NetworkSliceBooking.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NetworkSliceBooking/blob/r1.1/code/API_definitions/NetworkSliceBooking.yaml)
### Added
* Upload Network Slice Booking API initial documentation in [#4](https://github.com/camaraproject/NetworkSliceBooking/pull/4) 
* Add Network Slice Booking API user story in [#13](https://github.com/camaraproject/NetworkSliceBooking/pull/13)
* Add API design document in [#20](https://github.com/camaraproject/NetworkSliceBooking/pull/20)
* Initial API yaml including Network Slice Booking API in [#32](https://github.com/camaraproject/NetworkSliceBooking/pull/32)
* Add API checklist in [#48](https://github.com/camaraproject/NetworkSliceBooking/pull/48)
* Update API yaml, modify and format the status codes 200, 204, 404, 409 aligment with commonalities in [#50](https://github.com/camaraproject/NetworkSliceBooking/pull/50)
* Update API yaml, remove AUTHENTICATION_REQUIRED error code in [#55](https://github.com/camaraproject/NetworkSliceBooking/pull/55)
* Add the test file of Network Slice Booking API and update the file of checklist in [#57](https://github.com/camaraproject/NetworkSliceBooking/pull/57)
* Align the API definition with Commonalities r3.2 and ICM r3.2 in [#59](https://github.com/camaraproject/NetworkSliceBooking/pull/59)
**Full Changelog**: https://github.com/camaraproject/NetworkSliceBooking/commits/r1.1
