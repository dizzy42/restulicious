require "rest_resource/version"
require 'active_support/all'

module RestResource
  autoload :Attributes,   "rest_resource/attributes"
  autoload :QueryMethods, "rest_resource/query_methods"
  autoload :Coordinator,  "rest_resource/coordinator"
end
