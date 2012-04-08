require "earch/version"

module Earch
  autoload :Earch, 'earch/earch'
  autoload :Mapping, "earch/mapping"

  def init(server, port)
    return Earch.new(server, port)
  end
end
