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
      field = Mapping::Field.new name, map_options
      @mapping.add_field field
    end

  end
end

