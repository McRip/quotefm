require 'spec_helper'
require "rspec"
require "quotefm"
require 'fakeweb'

FakeWeb.allow_net_connect = false

describe Quotefm::Article do

  it "should get an article by ID" do
    stub_uri(:get, "/article/get/?id=2111", "quotefm/article/get.json")
    response = Quotefm::Article.getByID 2111
    response['id'].should == 2111
    response['url'].should == "http:\/\/www.spiegel.de\/kultur\/literatur\/0,1518,790592-2,00.html"
  end

  it "should get an article by URL" do
    stub_uri(:get, "/article/get/?url=http://www.spiegel.de/kultur/literatur/0,1518,790592-2,00.html", "quotefm/article/get.json")
    response = Quotefm::Article.getByURL "http://www.spiegel.de/kultur/literatur/0,1518,790592-2,00.html"
    response['id'].should == 2111
    response['url'].should == "http:\/\/www.spiegel.de\/kultur\/literatur\/0,1518,790592-2,00.html"
  end

  it "should get articles by page" do
    stub_uri(:get, "/article/listByPage/?id=23", "quotefm/article/listByPage.json")
    response = Quotefm::Article.listByPage 23
    response['totalCount'].should == "53"
    response['entities'].count.should == 53
  end

  it "should get articles by category" do
    stub_uri(:get, "/article/listByCategories/?ids=1", "quotefm/article/listByCategories.json")
    response = Quotefm::Article.listByCategories "1"
    response['totalCount'].should == "2947"
    response['entities'].count.should == 15
  end
end