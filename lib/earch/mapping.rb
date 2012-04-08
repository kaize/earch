module Earch
  class Mapping

    #def initialize(&block)
    #  instance_eval &block
    #end
    #
    class << self

      def build(name, &block)
        mapping = { name => {} }

        mapping
      end

    end

    #def field(name, type)
    #
    #end

  end
end