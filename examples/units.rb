require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Unit Examples
# =========================================

# ===========================

property_id = 13
rv_client.units(property_id).each do |unit|
  puts unit.address
end

# ===========================

property_id = 13
unit_id = 38
rvu = rv_client.unit(property_id, unit_id)
puts rvu.address

# ===========================
