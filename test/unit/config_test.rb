require File.expand_path('../../support/test_helper', __FILE__)

describe Restulicious::Config do
  describe "with block" do
    it "has defaults" do
      Restulicious.config {}
      assert_kind_of Typhoeus::Hydra,                Restulicious.config.hydra
      assert_equal   Restulicious::Parser::Default,  Restulicious.config.parser_class
      assert_equal   Restulicious::Adapter::Default, Restulicious.config.adapter_class
    end

    it "set options overrides defaults" do
      Restulicious.config do |config|
        config.adapter_class = "boo"
        config.hydra         = "yah"
        config.parser_class  = "w00t"
      end
      assert_equal "boo",  Restulicious.config.adapter_class
      assert_equal "yah",  Restulicious.config.hydra
      assert_equal "w00t", Restulicious.config.parser_class
    end

    it "set 1 option, other defaults remain" do
      Restulicious.config do |config|
        config.adapter_class   = "boo"
      end
      assert_equal   "boo",                         Restulicious.config.adapter_class
      assert_kind_of Typhoeus::Hydra,               Restulicious.config.hydra
      assert_equal   Restulicious::Parser::Default, Restulicious.config.parser_class
    end

  end

  describe "without block" do
    it "has defaults" do
      assert_kind_of Typhoeus::Hydra,                Restulicious.config.hydra
      assert_equal   Restulicious::Parser::Default,  Restulicious.config.parser_class
      assert_equal   Restulicious::Adapter::Default, Restulicious.config.adapter_class
    end

    it "set options overrides defaults" do
      Restulicious.config.adapter_class = "boo"
      Restulicious.config.hydra         = "yah"
      Restulicious.config.parser_class  = "w00t"
      assert_equal "boo",  Restulicious.config.adapter_class
      assert_equal "yah",  Restulicious.config.hydra
      assert_equal "w00t", Restulicious.config.parser_class
    end

    it "set 1 option, other defaults remain" do
      Restulicious.config.adapter_class   = "boo"
      assert_equal   "boo",                         Restulicious.config.adapter_class
      assert_kind_of Typhoeus::Hydra,               Restulicious.config.hydra
      assert_equal   Restulicious::Parser::Default, Restulicious.config.parser_class
    end

  end
  after do
    Restulicious.instance_variable_set(:@config, Restulicious::Config.new)
  end
end


