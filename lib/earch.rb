require "earch/version"
require "active_support"
require "active_support/inflector"

module Earch
  autoload :Earch, 'earch/earch'
  autoload :Mapping, "earch/mapping"
  autoload :MappingBuilder, "earch/mapping_builder"
  autoload :Adapter, 'earch/adapter'
  autoload :Transport, 'earch/transport'
  autoload :Result, 'earch/result'
  autoload :SearcherBase, 'earch/searcher_base'
  autoload :QueryBuilder, 'earch/query_builder'
  autoload :Builders, 'earch/builders'
  autoload :Response, 'earch/response'

  def self.init(server, port, transport = nil)
    transport ||= :http
    return Earch.new(server, port, transport)
  end
end
