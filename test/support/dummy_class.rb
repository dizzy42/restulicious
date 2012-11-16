class DummyClass
  include Restulicious::QueryMethods
  include Restulicious::Attributes
  attributes :id, :name
  api_options url: "www.awesome.com/stuff",
    key: "dummies"

  def self.from_api(attributes)
    new(attributes)
  end
end
