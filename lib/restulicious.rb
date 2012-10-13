require 'typhoeus'
require 'json'
require "restulicious/version"
require 'active_support/all'

module Restulicious
  autoload :Attributes,      "restulicious/attributes"
  autoload :QueryMethods,    "restulicious/query_methods"
  autoload :QueryInterface,  "restulicious/query_interface"
  autoload :Config,          "restulicious/config"
  autoload :Coordinator,     "restulicious/coordinator"
  autoload :Adapter,         "restulicious/adapter"
  Adapter.autoload :Default, "restulicious/adapter/default"
  Adapter.autoload :RESTApi, "restulicious/adapter/rest_api"
  autoload :Parser,          "restulicious/parser"
  Parser.autoload :Default,  "restulicious/parser/default"

  def self.config
    @config ||= Config.new
    if block_given?
      yield @config
    else
      @config
    end
  end
end
