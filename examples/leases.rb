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

# rv_client.leases.each do |lease|
#   puts lease
# end

# ===========================

lease_id = 7
rv_obj = rv_client.lease(lease_id)
puts rv_obj.address

# ===========================

lease_id = 7
rv_obj = rv_client.lease_tenants(lease_id)
puts rv_obj.name

# ===========================

lease_id = 7
rv_obj = rv_client.lease_occupants(lease_id)
puts rv_obj.name

# ===========================

rv_client.export_leases.each do |lease|
  binding.pry
  adsf=3
end

# ===========================

lease_id = 1
rv_client.export_leases(lease_ids: [lease_id]).each do |lease|
  binding.pry
  adsf=3
end

# ===========================

# Filter by lease_ids
lease_ids = [1,2]
leases = rv_client.export_leases(leaseIDs: lease_ids)
