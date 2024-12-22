require 'pry-byebug'
require 'dotenv'
require_relative '../lib/rentvine'

Dotenv.load

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# Transaction Examples
# =========================================

rv_client.transactions.each do |transaction|
  puts transaction.description
end
