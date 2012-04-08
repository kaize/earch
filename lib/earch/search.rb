module Earch
  class SearchBuilder

    def initialize
      @items = {}
    end

    def filter(&blk)
      @items[:filter] << Search::Filter.new(&blk)
    end

    def query(&blk)
      @items[:query] << Search::Query.new(&blk)
    end

  end
end