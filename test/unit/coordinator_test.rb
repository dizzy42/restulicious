require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::Coordinator do
  describe "Interface" do

    before do
      @coordinator = RestResource::Coordinator.new(Class.new)
      @coordinator.instance_variable_set(:@url, "www.example.com")
    end

    it "has where method, which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:where).with(id: 5)
      @coordinator.where(id: 5)
    end

    it "has from method, which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:from).with("www.awesome.com/url/you/love")
      @coordinator.from("www.awesome.com/url/you/love")
    end

    it "has limit method, which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:limit).with(10)
      @coordinator.limit(10)
    end

    it "has offset method, which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:offset).with(10)
      @coordinator.offset(10)
    end

    it "has select method which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:select).with("id,name")
      @coordinator.select("id,name")
    end

    it "uses the same query interface each time" do
      assert_equal @coordinator.query_interface, @coordinator.query_interface
    end

    it "has api_options method, that stores url" do
      url = "http://www.example.com"
      @coordinator.api_options(url: url)
      assert_equal url, @coordinator.instance_variable_get(:@url)
    end

    it "passes url along to query interface" do
      url = "http://www.example.com"
      @coordinator.api_options(url: url)
      RestResource::QueryInterface.expects(:new).with(url)

      @coordinator.query_interface
    end

    it "chains interface methods on coordinator" do
      @coordinator.expects(:all)
      @coordinator.from("www.what.com").offset(10).limit(100).where(id: 42).select("id,name").all
    end

    it "has first method"
    it "has all method"
  end
end

