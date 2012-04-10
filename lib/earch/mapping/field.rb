module Earch
  class Mapping::Field

    attr_reader :name

    def initialize(field_name, field_options)

      @name = field_name
      @options = field_options

    end

    def options
      @options[:options]
    end

    def nested
      @options[:nested]
    end

    def nested?
      @options[:nested] != nil
    end

    def extract_method
      @options[:extract_method]
    end

  end
end

