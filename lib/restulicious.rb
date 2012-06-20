require 'typhoeus'
require 'json'
require "restulicious/version"
require 'active_support/all'

module Restulicious
  autoload :Attributes,     "restulicious/attributes"
  autoload :QueryMethods,   "restulicious/query_methods"
  autoload :Coordinator,    "restulicious/coordinator"
  autoload :QueryInterface, "restulicious/query_interface"
  autoload :Connection,     "restulicious/connection"
  autoload :Parser,         "restulicious/parser"
end
