require File.expand_path('../../support/test_helper', __FILE__)

describe RestResource::QueryInterface do
  describe "Interface" do

    before do
      @interface = RestResource::QueryInterface.new("http://bigdeal.com/the/next/:thing")
    end

    it "stores url in @url for from" do
      url = "http://twitter.com/rocks/and/stuff"
      @interface.from(url)
      assert_equal url, @interface.instance_variable_get(:@url)
    end

    it "stores params in @params for where" do
      params = {
        id:    123,
        stuff: "w00t"
      }
      @interface.where(params)
      assert_equal params, @interface.instance_variable_get(:@params)
    end

    it "stores limit in @params for limit" do
      limit = 10
      @interface.limit(limit)
      assert_equal limit, @interface.instance_variable_get(:@params)[:limit]
    end

    it "stores offest in @params for offset" do
      offset = 100
      @interface.offset(offset)
      assert_equal offset, @interface.instance_variable_get(:@params)[:offset]
    end

    it "stores fields in @params for select" do
      fields = "id,name,gender"
      @interface.select(fields)
      assert_equal fields, @interface.instance_variable_get(:@params)[:fields]
    end

    describe "all_url" do
      it "does string interpolation"
      it "uses full url"
    end

    describe "first_url" do
      it "does string interpolation"
      it "uses @url if set"
      it "adds id if present"
      it "does not add trailing slash"
    end
  end
end

