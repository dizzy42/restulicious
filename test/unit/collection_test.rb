require File.expand_path('../../support/test_helper', __FILE__)

describe Restulicious::Collection do
  before do
    dummies = [
      { id: 1, name: "Einstein" },
      { id: 2, name: "Jobs" }
    ]
    data = { "collection" => dummies, "total" => 2 }
    @collection = Restulicious::Collection.from_parser(DummyClass, "collection", data)
  end

  it "contains DummyClass objects" do
   assert_kind_of DummyClass, @collection.first
  end

  it "each runs on the objects" do
    @collection.each do |item|
      assert_kind_of DummyClass, @collection.first
    end
  end

  it "sets others keys as methods" do
    assert_equal 2, @collection.total
  end

end

