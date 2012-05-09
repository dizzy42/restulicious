require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::Attributes do

  before do
    @object = DummyClass.new
  end

  it "provides getter for declared attributes" do
    assert_nil @object.id
  end

  it "provides setter for declared attributes"
  it "sets attributes from hash passed to new"

end

