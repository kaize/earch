module Earch
  class SearcherBase
    class << self
      def document_name(name)
        @document_name = name
      end

      def index_name(name)
        @index_name = name
      end

      def model(value)
        @model = value
      end

      def mapping(&block)
        #TODO
        #@mapping = value
      end

      def search(&blk)
        hash = build_hash(&blk)
      end

      def adapter(value)
        @adapter = value
      end

      #private
      def build_hash(&blk)
        QueryBuilder.build(&blk)
      end

    end

  end
end
