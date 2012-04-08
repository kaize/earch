require "earch/version"

module Earch
  autoload :Earch, 'earch/earch'
  autoload :Mapping, "earch/mapping"
  autoload :Adapter, 'earch/adapter'
  autoload :Transport, 'earch/transport'
  autoload :Support, 'earch/support'
  autoload :Result, 'earch/result'

  def self.init(server, port, transport = nil)
    transport ||= :http
    return Earch.new(server, port, transport)
  end
end
