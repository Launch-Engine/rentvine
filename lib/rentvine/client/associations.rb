module Rentvine
  class Client
    module Associations
      def associations(args = {})
        results = process_request(:get, 'associations/search', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::Association.new(result[:contact]) }
      end
      alias list_associations associations
    end
  end
end
