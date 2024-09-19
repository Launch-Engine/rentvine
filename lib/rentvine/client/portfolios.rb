module Rentvine
  class Client
    module Portfolios
      def portfolios(args = {})
        results = process_request(:get, 'portfolios/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          contacts_str = result[:portfolio].delete(:contacts)
          rvobj = Rentvine::Portfolio.new(result[:portfolio])

          begin
            rvobj.owner_distributions = process_rentvine_response(contacts_str).map do |owner|
              Rentvine::OwnerDistribution.new(owner)
            end
          rescue
            rvobj.owner_distributions = contacts_str
          end

          rvobj.statement_setting = result[:statement_setting]
          rvobj.last_statement = result[:last_statement]
          rvobj.meta = { appends: [:owner_distributions, :statement_setting, :last_statement] }
          rvobj
        end
      end
      alias list_portfolios portfolios
    end
  end
end
