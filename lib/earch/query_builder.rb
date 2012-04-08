module Earch
  class QueryBuilder
    attr_reader :query

    def initialize(&blk)
      @query = {}
      instance_eval(&blk)
    end

    def self.build(&blk)
      obj = new(&blk)
      obj.query
    end

    def filter(&blk)
      add_query = Builders::Filter.build(&blk)
      @query.merge!(add_query)
    end
  end
end
