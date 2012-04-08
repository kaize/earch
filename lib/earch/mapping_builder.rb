module Earch
  class MappingBuilder
    attr_reader :mapping

    def initialize(&blk)
      @mapping = Mapping.new
      instance_eval &blk
    end

    def self.build(&blk)
      obj = new(&blk)
      obj.mapping
    end

    def field(name, *args, &blk)
      options = args.extract_options!
      from_field = args.shift

      map_options = {
          #TODO: подумать над необходимостью лямбды :)
          :extract_method => from_field || name,
          :options => options
      }
      map_options[:nested] = self.class.build(&blk) if block_given?
      @mapping.add_field name, map_options
    end

  end
end

