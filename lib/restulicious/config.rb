module Restulicious
  class Config

    attr_accessor :hydra, :adapter_class, :parser_class

    def initialize
      self.hydra            = Typhoeus::Hydra.new
      self.adapter_class    = Adapter::Default
      self.parser_class     = Parser::Default
    end

  end
end
