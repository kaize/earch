require "earch/version"

module Earch
  autoload :Earch, 'earch/earch'

  def init(server, port)
    return Earch.new(server, port)
  end
end
