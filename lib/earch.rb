require "earch/version"
require "active_support"
require "active_support/inflector"

module Earch
  autoload :Earch, 'earch/earch'
  autoload :Mapping, "earch/mapping"
  autoload :Adapter, 'earch/adapter'
  autoload :Transport, 'earch/transport'
  autoload :Result, 'earch/result'
  autoload :SearcherBase, 'earch/searcher_base'
  autoload :QueryBuilder, 'earch/query_builder'
  autoload :Builders, 'earch/builders'

  def self.init(server, port, transport = nil)
    transport ||= :http
    return Earch.new(server, port, transport)
  end
end
