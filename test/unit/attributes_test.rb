require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::Attributes do

  before do
    @object = DummyClass.new
  end

  it "provides getter for declared attributes" do
    assert_nil @object.id
  end

  it "provides setter for declared attributes" do
    @object.id = 123
    assert_equal 123, @object.id
  end

  it "sets attributes from hash passed to new" do
    object = DummyClass.new(id: 1234)
    assert_equal 1234, object.id
  end

  it "checks utf8 encoding"

end

