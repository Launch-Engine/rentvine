require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Owner Examples
# =========================================

rv_client.owners.each do |owner|
  puts owner.name
end
