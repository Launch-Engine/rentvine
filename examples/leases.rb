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
# Lease Examples
# =========================================

rv_client.leases.each do |lease|
  puts lease
end

# ===========================

lease_id = 7
rv_obj = rv_client.lease(lease_id)
puts rv_obj.address
# ===========================

lease_id = 7
rv_obj = rv_client.lease_tenants(lease_id)
puts rv_obj.name

# ===========================

rv_client.export_leases.each do |lease|
  binding.pry
  adsf=3
end