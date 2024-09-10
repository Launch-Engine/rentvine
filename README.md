# Rentvine

This gem is a wrapper for the Rentvine API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rentvine'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rentvine

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Implemented Endpoints

- Export
  - Leases
    - Export Lease: `GET /leases/export`
  - Properties
    - Export Properties `GET /properties/export`
  - Units
    - Export Units `GET /properties/units/export`
  - Applications
    - Export Applications `GET /screenings/application/export`

- Accounting
  - Accounts
    - List `GET /accounting/accounts`
  - Bills
    - List `GET /accounting/bills`
    - Create `POST /accounting/bills`
    - View `GET /accounting/bills/:bill_id`
  - Ledgers
    - List `GET /accounting/ledgers`
    - Search `GET /accounting/ledgers/search`
  - Transactions
    - Search `GET /accounting/transactions/search`
  - Transaction Entries
    - Search `GET /accounting/transactions/entries/search`
  - Diagnostics
    - Unused Vendor Credits `GET /accounting/diagnostics/unused-vendor-credits`
    - Suppressed Fee Balance Mismatch `GET /accounting/diagnostics/suppressed-fee-balance-mismatch`
    - Negative Bank Accounts `GET /accounting/diagnostics/negative-bank-accounts`
    - Reserve Not Met By Ledger `GET /accounting/diagnostics/reserve-not-met`
    - Escrow Mismatch By Ledger `GET /accounting/diagnostics/escrow-mismatch`
    - Prepayment Mismatch By Ledger `/accounting/diagnostics/prepayment-mismatch`
    - Unused Prepayments `GET /accounting/diagnostics/unused-prepayments`
    - Bank Account Reconcialiation Lapse `GET /accounting/diagnostics/bank-account-reconciliation-lapse`
    - Vendor Insurance Lapse `GET /accounting/diagnostics/vendor-insurance-lapse`
    - Credit Debit Mismatch `GET /accounting/diagnostics/credit-debit-mismatch`
    - Manager Ledger Balances `GET /accounting/diagnostics/manager-ledger-balance`

- Contacts
  - Owners
    - List `GET /owners/search`
  - Tenants
    - List `GET /tenants/search`
  - Vendors
    - List `GET /vendors/search`
  - Associations
    - List `GET /associations/search`

- Files
  - Files
    - List `GET /files`
    - View `GET /files/:file_id`
    - Upload `POST /files`
    - Delete `DELETE /files/:file_id`

- Leases
  - Leases
    - List `GET /leases`
    - View `GET /leases/:lease_id`

- Maintenance
  - Work Orders
    - List `GET /maintenance/work-orders`
    - Create `POST /maintenance/work-orders`
    - View `GET /maintenance/work-orders/:work_order_id`
  - Work Order Statuses
    - List `GET /maintenance/work-orders/statuses`
    - Create `POST /maintenance/work-orders/statuses`
    - View `GET /maintenance/work-orders/statuses/:work_order_id`
  - Vendor Trades
    - List `GET /maintenance/vendor-trades`
    - Create `POST /maintenance/vendor-trades`
    - View `GET /maintenance/vendor-trades/:work_order_id`
  - Inspections
    - List `GET /maintenance/inspections`
    - Create `POST /maintenance/inspections`
    - View `GET /maintenance/inspections/:work_order_id`

- Portfolios
  - Portfolios
    - List `GET /portfolios/search`

- Properties
  - Properties
    - List `GET /properties`
    - Create `POST /properties`
    - View `GET /properties/:property_id`
    - Update `POST /properties/:property_id`
    - Delete `DELETE /properties/:property_id`
    - Deactiveate `POST /properties/:property_id/deactivate`
    - Activate `POST /properties/:property_id/activate`
  - Units
    - List `GET /properties/:property_id/units`
    - View `GET /properties/:property_id/units/:unit_id`


## TODO Endpoints

All known endpoints have been implemented. If you know of any endpoints that are not listed above, please open an issue or a pull request.

## Helper Object Type

`Object Types` is under the API documentation.
You can access the options type helper as a hash by calling `Rentvine::OBJECT_TYPES`.
This will return a hash of all the object types and their corresponding values.

## Limitations

In order to use the Rentvine API you must first have a Rentvine account. At this time, Rentvine does offer a sandbox environment for testing, but you will need to reach out to them to see about getting it. This gem can be used with both the sandbox and production environments.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Launch-Engine/rentvine. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Launch-Engine/rentvine/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the rentvine project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Launch-Engine/rentvine/blob/main/CODE_OF_CONDUCT.md).
