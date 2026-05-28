require 'pry-byebug'
require 'dotenv'
require_relative '../lib/rentvine'

Dotenv.load('../.env')

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Recurring Charges Examples
# =========================================

lease_id = 7

rv_client.recurring_charges(lease_id).each do |charge|
  puts [charge.lease_recurring_charge_id, charge.description, charge.amount, charge.account.is_rent].join(' - ')
end

# ===========================

lease_id = 7
lease_recurring_charge_id = 10
charge = rv_client.recurring_charge(lease_id, lease_recurring_charge_id)
puts [charge.lease_recurring_charge_id, charge.description, charge.amount, charge.previous_charge&.amount].join(' - ')
