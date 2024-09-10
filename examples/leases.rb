require 'pry-byebug'
require_relative '../lib/rentvine'

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
