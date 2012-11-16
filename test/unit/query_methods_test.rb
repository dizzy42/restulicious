require File.expand_path('../../support/test_helper', __FILE__)

describe Restulicious::QueryMethods do

  it "has where method, which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:where).with(id: 5)
    DummyClass.where(id: 5)
  end

  it "has from method, which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:from).with("www.awesome.com/url/you/love")
    DummyClass.from("www.awesome.com/url/you/love")
  end

  it "has limit method, which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:limit).with(10)
    DummyClass.limit(10)
  end

  it "has offset method, which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:offset).with(10)
    DummyClass.offset(10)
  end

  it "has select method which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:select).with("id,name")
    DummyClass.select("id,name")
  end

  it "has first method, which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:first)
    DummyClass.first
  end

  it "has all method, which sends to coordinator" do
    Restulicious::Coordinator.any_instance.expects(:all)
    DummyClass.all
  end

end

