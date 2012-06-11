require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::Connection do

  it "has a get method, that expects url and params" do
    RestResource::Connection.new.get("http://www.example.com", { id: 123 })
  end

end


