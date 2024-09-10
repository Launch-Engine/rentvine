module Rentvine
  class Client
    module Applications
      def export_applications(args = {})
        results = process_request(:get, 'screening/applications/export', params: args.to_camelback_keys)
        return results if results.is_a?(RentvineError)

        results.map do |result|
          rvobj = Rentvine::Portfolio.new(result[:application])
          rvobj.unit = Rentvine::Unit.new(result[:unit])
          rvobj.lease = Rentvine::Lease.new(result[:lease])
          rvobj.meta = { appends: [:unit, :lease] }
          rvobj
        end
      end
    end
  end
end
