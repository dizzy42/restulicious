module Restulicious
  class Config

    attr_accessor :hydra, :connection_class, :parser_class

    def initialize
      self.hydra            = Typhoeus::Hydra.new
      self.connection_class = Connection::Default
      self.parser_class     = Parser
    end

  end
end
