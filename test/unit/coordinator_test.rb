require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::QueryInterface do
  describe "Interface" do

    before do
      @coordinator = RestResource::Coordinator.new
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

    it "has first method, which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:first)
      @coordinator.first
    end

    it "has all method, which sends to interface" do
      RestResource::QueryInterface.any_instance.expects(:all)
      @coordinator.all
    end

    it "uses the same query interface each time" do
      assert_equal @coordinator.query_interface, @coordinator.query_interface
    end
  end
end

