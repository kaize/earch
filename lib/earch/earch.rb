module Earch
  class Earch
    attr_reader :adapter

    def initialize(server, port, transport)
      @adapter = Adapter.init(server, port, transport)
    end

    def create(index, doctype, mapping = nil)
      put_index(index)
      if !doctype.to_s.empty? && mapping
        put_mapping(index, doctype, mapping)
      end
    end

    def put_index(index)
      uri = build_path(index)
      response = @adapter.put(uri)
    end

    def put_mapping(index, doctype, mapping)
      uri = build_path(index, doctype, "_mapping")
      response = @adapter.put(uri, mapping)
    end

    def drop(index)
      uri = build_path(index)
      response = @adapter.delete(uri)
    end

    def search

    end

    def build_path(*args)
      uri = ['', *args]
      uri.join('/')
    end

  end
end
