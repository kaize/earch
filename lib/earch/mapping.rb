module Earch
  class Mapping
    def initialize
      @fields = {}
    end

    def add_field(name, options)
      @fields[name] = options
    end

    def to_hash
      result = {}
      @fields.each do |key, map_options|
        result[key] = map_options[:options]
        result[key].merge! map_options[:nested].to_hash if map_options[:nested]
      end
      {:properties => result}.to_hash
    end

    def to_json
      to_hash.to_json
    end
  end
end
