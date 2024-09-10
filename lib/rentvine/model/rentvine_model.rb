module Rentvine
  class RentvineModel < OpenStruct
    def initialize(data = {})
      super(data)
    end

    def to_rentvine_hash
      data_hash = to_h

      # Remove custom appends from the hash
      meta&.dig(:appends)&.each { |key| data_hash.delete(key) }
      data_hash.delete(:meta)

      data_hash = data_hash.to_camelback_keys

      data_hash.keys.each do |key|
        next if (key.to_s =~ /Id$/).nil?

        new_key = key.to_s.gsub(/Id$/, 'ID')
        data_hash[new_key.to_sym] = data_hash.delete(key)
      end

      data_hash.to_camelback_keys
    end
  end
end
