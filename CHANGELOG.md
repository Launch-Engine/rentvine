## [Unreleased]

## [0.5.0] - 2025-06-22

- Added support to load an individual tenant by id.
- Update the endpoint used for fetching owners.
- Dockerized the project for easier development for those on Windows.
- Fixed spelling error in the lease model example.
- Added support to load recurrening charges for a lease.
- Updated gems to the latest versions.

## [0.4.0] - 2025-01-30

- Added support on the lease to load the tenants for the lease.
- Added dependency for ostruct ~> 0.6.1.

## [0.3.3] - 2025-01-26

- Updated call to tenants to use "/tenants" instead of "/tenants/search".

## [0.3.2] - 2025-01-25

- Fixed call to leases export endpoint to use the correct spelling.

## [0.3.1] - 2024-09-20

- Resolved issue with the file upload trying to use Rentvine::File instead of Ruby's File class.

## [0.3.0] - 2024-09-19

- Added model for parsing the owner distributions on the portfolio response.

## [0.2.0] - 2024-09-15

- Added export endpoints for properties, units, and leases.
- Updated examples to show export usage for properties, units, and leases.
- Added model for lease balances.
- Added example for lease balances.

## [0.1.0] - 2024-09-01

- Initial release
