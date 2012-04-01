require 'spec_helper'
require "rspec"
require "quotefm"
require 'fakeweb'

FakeWeb.allow_net_connect = false

describe Quotefm::Page do

  it "should get a page by ID" do
    stub_uri(:get, "/page/get/?domain=zeit.de", "quotefm/page/get.json")
    response = Quotefm::Page.getByDomain "zeit.de"
    response['id'].should == 24
    response['name'].should == "zeit.de"
  end

  it "should get a page by domain" do
    stub_uri(:get, "/page/get/?id=24", "quotefm/page/get.json")
    response = Quotefm::Page.getByID 24
    response['id'].should == 24
    response['name'].should == "zeit.de"
  end

  it "should get all pages" do
    stub_uri(:get, "/page/list", "quotefm/page/list.json")
    response = Quotefm::Page.list
    response['totalCount'].should == "4563"
    response['entities'].count.should == 100
  end
end