require_relative 'client/accounts'
require_relative 'client/applications'
require_relative 'client/associations'
require_relative 'client/bills'
require_relative 'client/diagnostics'
require_relative 'client/files'
require_relative 'client/inspections'
require_relative 'client/leases'
require_relative 'client/ledgers'
require_relative 'client/owners'
require_relative 'client/portfolios'
require_relative 'client/properties'
require_relative 'client/tenants'
require_relative 'client/transaction_entries'
require_relative 'client/transactions'
require_relative 'client/units'
require_relative 'client/vendor_trades'
require_relative 'client/vendors'
require_relative 'client/work_order_statuses'
require_relative 'client/work_orders'

require_relative 'model/rentvine_model'
require_relative 'model/account'
require_relative 'model/application'
require_relative 'model/association'
require_relative 'model/balance'
require_relative 'model/bill'
require_relative 'model/diagnostic'
require_relative 'model/file'
require_relative 'model/inspection'
require_relative 'model/lease'
require_relative 'model/ledger'
require_relative 'model/owner'
require_relative 'model/owner_distribution'
require_relative 'model/portfolio'
require_relative 'model/property'
require_relative 'model/tenant'
require_relative 'model/transaction_entry'
require_relative 'model/transaction'
require_relative 'model/unit'
require_relative 'model/vendor_trade'
require_relative 'model/vendor'
require_relative 'model/work_order_status'
require_relative 'model/work_order'

module Rentvine
  class Client
    include Rentvine::Client::Accounts
    include Rentvine::Client::Applications
    include Rentvine::Client::Associations
    include Rentvine::Client::Bills
    include Rentvine::Client::Diagnostics
    include Rentvine::Client::Files
    include Rentvine::Client::Inspections
    include Rentvine::Client::Leases
    include Rentvine::Client::Ledgers
    include Rentvine::Client::Owners
    include Rentvine::Client::Portfolios
    include Rentvine::Client::Properties
    include Rentvine::Client::Tenants
    include Rentvine::Client::TransactionEntries
    include Rentvine::Client::Transactions
    include Rentvine::Client::Units
    include Rentvine::Client::VendorTrades
    include Rentvine::Client::Vendors
    include Rentvine::Client::WorkOrderStatuses
    include Rentvine::Client::WorkOrders

    def initialize(auth = nil)
      @auth = auth || load_from_environment

      if @auth.nil?
        raise RentvineError, 'API authentication incomplete! You need the account code, api key and api secret.'
      end
    end

    private

    def load_from_environment
      return if ENV['RENTVINE_ACCOUNT_CODE'].nil? || ENV['RENTVINE_API_KEY'].nil? || ENV['RENTVINE_API_SECRET'].nil?

      {
        account_code: ENV['RENTVINE_ACCOUNT_CODE'],
        api_key: ENV['RENTVINE_API_KEY'],
        api_secret: ENV['RENTVINE_API_SECRET']
      }
    end

    def process_file(file_path, params)
      request_params = {
        method: :post,
        params: params.to_camelback_keys,
        headers: {
          "Content-Type" => "multipart/form-data",
          'Authorization' => "Basic #{rentvine_basic_auth}"
        },
        body: { file: File.open(file_path) }
      }

      proxy = @auth[:proxy] || ENV['PROXY']
      request_params[:proxy] = proxy unless proxy.nil?

      response = Typhoeus::Request.new(
        "https://#{@auth[:account_code]}.rentvine.com/api/manager/files",
        request_params
      ).run
      return RentvineError.new(response) unless response.success?

      process_rentvine_response(response.body)
    end

    def process_rentvine_response(response_body)
      JSON.parse(response_body, symbolize_names: true).to_snake_keys
    rescue
      response_body
    end

    def process_request(request_type, url_path, options = {})
      options_params = options[:params] || {}
      request_params = {
        method: request_type,
        params: options_params.to_camelback_keys,
        headers: rentvine_auth_headers,
        body: options[:body]&.to_json
      }

      proxy = @auth[:proxy] || ENV['PROXY']
      request_params[:proxy] = proxy unless proxy.nil?

      response = Typhoeus::Request.new(
        "https://#{@auth[:account_code]}.rentvine.com/api/manager/#{url_path}",
        request_params
      ).run
      return RentvineError.new(response) unless response.success?

      process_rentvine_response(response.body)
    end

    def rentvine_auth_headers
      {
        'Content-Type' => 'application/json',
        'charset' => 'utf-8',
        'Authorization' => "Basic #{rentvine_basic_auth}"
      }
    end

    def rentvine_basic_auth
      Base64.strict_encode64("#{@auth[:api_key]}:#{@auth[:api_secret]}")
    end
  end
end