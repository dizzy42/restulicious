require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::QueryMethods do

  before do
    DummyClass.send(:include, RestResource::QueryMethods)
  end

  it "has where method, which sends to coordinator" do
    RestResource::Coordinator.expects(:where).with(id: 5)
    DummyClass.where(id: 5)
  end

  it "has from method"
  it "has"
end

