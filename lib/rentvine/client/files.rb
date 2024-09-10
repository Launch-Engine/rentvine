module Rentvine
  class Client
    module Files
      def files(args = {})
        results = process_request(:get, 'files', params: args)
        return results if results.is_a?(RentvineError)

        results.map { |result| Rentvine::File.new(result[:file]) }
      end
      alias list_files files

      def file(file_id)
        result = process_request(:get, "files/#{file_id}")
        return result if result.is_a?(RentvineError)

        Rentvine::File.new(result[:file])
      end

      def upload_file(path_to_file, object_type_id, object_id)
        result = process_file(
          path_to_file,
          { object_type_id: object_type_id, object_id: object_id }
        )
        return result if result.is_a?(RentvineError)

        Rentvine::File.new(result[:file])
      end

      def delete_file(file_id)
        result = process_request(:delete, "files/#{file_id}")
        return result if result.is_a?(RentvineError)

        true
      end
    end
  end
end
