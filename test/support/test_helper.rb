# require 'rubygems'
# require 'bundler'
# Bundler.setup

require 'minitest/autorun'
require 'mocha'
require 'restulicious'

# Load support files
Dir["#{File.dirname(__FILE__)}/**/*.rb"].each { |f| require f }

Mocha::Configuration.prevent(:stubbing_non_existent_method)
