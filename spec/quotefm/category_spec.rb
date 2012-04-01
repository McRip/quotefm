require "rspec"

describe Quotefm::Category do

  it "should get a list of categories" do
    stub_uri(:get, "/category/list", "quotefm/category/list.json")
    response = Quotefm::Category.list
    response['totalCount'].should == "11"
    response['entities'].count.should == 11
  end
end