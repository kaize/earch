require 'net/http'
require 'json'

module Earch
  module Transport
    class HTTP
      include Support

      def initialize(host, port)
        @uri = URI('')
        @uri.scheme = "http"
        @uri.host = host
        @uri.port = port
        @http = Net::HTTP.new(@uri.host, @uri.port)
      end

      def get(path, body = nil)
        request(:get, path, body)
      end

      def post(path, body = nil)
        request(:post, path, body)
      end

      def put(path, body = nil)
        request(:put, path, body)
      end

      def delete(path, body = nil)
        request(:delete, path, body)
      end

      def request(type, path, body = nil)
        request_type = constantize("Net::HTTP::#{type.capitalize}")

        request = request_type.new(path)

        if body && !body.strip.empty?
          request.body = body
        end

        result = @http.request(request)
        return fill_response(result)
      end

      def fill_response(result)
        {:status => result.code, :body => JSON.parse(result.body)}
      end

    end
  end
end
