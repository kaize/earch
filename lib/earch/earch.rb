module Earch
  class Earch

    def initialize(server, port, transport)
      @adapter = Adapter.init(server, port, transport)
    end

    def create(index, doctype, mapping = nil)
      if !doctype.to_s.empty? && mapping
        put_mapping(index, doctype, mapping)
      else
        put_index(index)
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
      #TODO

    end

    def build_path(*args)
      uri = ['', *args]
      uri.join('/')
    end

  end
end
