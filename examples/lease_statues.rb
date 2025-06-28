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

rv_client.lease_statuses.each do |lease_status|
  puts lease_status.name
end

# ===========================

lease_status_id = 10
rv_obj = rv_client.lease_status(lease_status_id)
puts rv_obj.name