module Earch
  class Response::Search < Response
    #TODO: only example

    include Enumerable

    def initialize(r, model_class)
      super r
      @model_class = model_class
    end

    def items
      @items ||= load_items
      @items
    end

    def each(&block)
      items.each do |item|
        block.call(item)
      end
    end

    def load_items
      r = []
      @response[:body]['hits']['hits'].each do |hit|
        r << @model_class.find(hit['_source']['id'].to_i)
      end
      r
    end

  end
end