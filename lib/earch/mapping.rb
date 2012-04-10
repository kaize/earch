module Earch
  class Mapping

    autoload :Field, "earch/mapping/field"

    attr_reader :fields

    def initialize
      @fields = {}
    end

    def add_field(field)
      @fields[field.name] = field
    end

    def to_hash
      result = {}
      @fields.each do |key, field|
        result[key] = field.options
        result[key].merge! field.nested.to_hash if field.nested?
      end
      {:properties => result}
    end

    def to_json
      to_hash.to_json
    end

  end
end
