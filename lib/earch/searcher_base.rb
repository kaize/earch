module Earch
  class SearcherBase
    class << self
      def document_name(name = nil)
        @document_name = name if name
        @document_name
      end

      def index_name(name = nil)
        @index_name = name if name
        @index_name
      end

      def model(value)
        @model = value
      end

      def mapping(&block)
        @mapping = MappingBuilder.build(&block) if block_given?
        @mapping
      end

      def create_document
        @connector.create(@index_name, @document_name)
      end

      def put_mapping
        @connector.put_mapping(index_name, document_name, {document_name => mapping.to_hash}.to_json)
      end

      def search(&blk)
        hash = build_hash(&blk)
      end

      def add_item(object)
        response = @adapter.put()
      end

      def delete_item()
      end

      def connector(value)
        @connector = value
      end

      #private
      def build_hash(&blk)
        QueryBuilder.build(&blk)
      end

    end
  end
end
