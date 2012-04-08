module Earch
  module Builders
    class Filter
      attr_reader :query

      def initialize(&blk)
        @query = {}
        instance_eval(&blk)
      end

      def self.build(&blk)
        obj = new(&blk)
        {:filter => obj.query}
      end

      #TODO для нескольких значений
      def term(key, value, options = {})
        add_query = {key => value}.merge(options)
        @query.merge!({:term => add_query})
      end
    end
  end
end
