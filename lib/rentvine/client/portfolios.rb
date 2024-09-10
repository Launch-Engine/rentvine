module Rentvine
  class Client
    module Portfolios
      def portfolios(args = {})
        results = process_request(:get, 'portfolios/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          rvobj = Rentvine::Portfolio.new(result[:portfolio])
          rvobj.statement_setting = result[:statement_setting]
          rvobj.last_statement = result[:last_statement]
          rvobj.meta = { appends: [:statement_setting, :last_statement] }
          rvobj
        end
      end
      alias list_portfolios portfolios
    end
  end
end
