require File.expand_path('../../support/test_helper', __FILE__)

describe Restulicious::Attributes do

  before do
    DummyClass.send(:include, Restulicious::Attributes)
    DummyClass.attributes(:id, :name)

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

  it "no exception if attribute passed in that isn't known" do
    object = DummyClass.new(unknown_attribute: 1234)
    assert_nil object.instance_variable_get(:@unknown_attribute)
  end

  it "checks utf8 encoding"

end

