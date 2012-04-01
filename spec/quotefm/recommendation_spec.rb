require 'spec_helper'
require "rspec"
require "quotefm"
require 'fakeweb'

FakeWeb.allow_net_connect = false

describe Quotefm::Recommendation do

  it "should get a recommendation" do
    stub_uri(:get, "/recommendation/get/?id=900", "quotefm/recommendation/get.json")
    response = Quotefm::Recommendation.get 900
    response['id'].should == 900
  end

  it "should get recommendations by Article" do
    stub_uri(:get, "/recommendation/listByArticle/?id=123", "quotefm/recommendation/listByArticle.json")
    response = Quotefm::Recommendation.listByArticle 123

    response['totalCount'].should == "1"
    response['entities'].count.should == 1
  end

  it "should get recommendations by User" do
    stub_uri(:get, "/recommendation/listByUser/?username=uarrr", "quotefm/recommendation/listByUser.json")
    response = Quotefm::Recommendation.listByUser "uarrr"

    response['totalCount'].should == "100"
    response['entities'].count.should == 100
  end
end