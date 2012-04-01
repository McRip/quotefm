require "rspec"

FakeWeb.allow_net_connect = false

describe Quotefm::User do

  it "should get a user by ID" do
    stub_uri(:get, "/user/get/?id=1", "quotefm/user/get.json")
    response = Quotefm::User.getByID 1
    response['id'].should == 1
    response['username'].should == "pwaldhauer"
  end

  it "should get a user by username" do
    stub_uri(:get, "/user/get/?username=pwaldhauer", "quotefm/user/get.json")
    response = Quotefm::User.getByUsername "pwaldhauer"
    response['id'].should == 1
    response['username'].should == "pwaldhauer"
  end

  it "should get a users followers" do
    stub_uri(:get, "/user/listFollowers/?username=pwaldhauer", "quotefm/user/listFollowers.json")
    response = Quotefm::User.listFollowers "pwaldhauer"
    response['totalCount'].should == "464"
  end

  it "should get a users followings" do
    stub_uri(:get, "/user/listFollowings/?username=pwaldhauer", "quotefm/user/listFollowings.json")
    response = Quotefm::User.listFollowings "pwaldhauer"
    response['totalCount'].should == "141"
  end
end