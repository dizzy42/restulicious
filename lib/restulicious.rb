require 'typhoeus'
require 'json'
require "restulicious/version"
require 'active_support/all'

module Restulicious
  autoload :Attributes,     "restulicious/attributes"
  autoload :QueryMethods,   "restulicious/query_methods"
  autoload :QueryInterface, "restulicious/query_interface"
  autoload :Config,         "restulicious/config"
  autoload :Coordinator,    "restulicious/coordinator"
  autoload :Parser,         "restulicious/parser"
  autoload :Connection,     "restulicious/connection"
  Connection.autoload :Default, "restulicious/connection/default"

  def self.config
    @config ||= Config.new
    if block_given?
      yield @config
    else
      @config
    end
  end
end
