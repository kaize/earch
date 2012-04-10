module Earch
  class Response

    autoload :Search, 'earch/response/search'

    def initialize(r)
      @response = r
    end

  end
end