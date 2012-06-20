require File.expand_path('../../support/test_helper', __FILE__)

describe Restulicious::Connection do

  it "has a get method, that expects url and params" do
    Restulicious::Connection.new.get("http://www.example.com", { id: 123 })
  end

end


