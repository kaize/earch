module Earch
  class Adapter

    class << self
      def init(server, port, transport)
        adapter = new
        transport = adapter.get_transport(transport)
        transport.new(server, port)
      end
    end

    def get_transport(transport_name)
      case transport_name
        when :http then Transport::HTTP
        else Transport::HTTP
      end
    end

  end
end
