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

  it "should get a users followers by username" do
    stub_uri(:get, "/user/listFollowers/?username=pwaldhauer", "quotefm/user/listFollowers.json")
    response = Quotefm::User.listFollowers "pwaldhauer"
    response['totalCount'].should == "464"
  end

  it "should get a users followers by username" do
    stub_uri(:get, "/user/listFollowers/?username=pwaldhauer", "quotefm/user/listFollowers.json")
    response = Quotefm::User.listFollowersByUsername "pwaldhauer"
    response['totalCount'].should == "464"
  end

  it "should get a users followers by user id" do
    stub_uri(:get, "/user/listFollowers/?id=1", "quotefm/user/listFollowers.json")
    response = Quotefm::User.listFollowersByID 1
    response['totalCount'].should == "464"
  end

  it "should get a users followings by username (new Syntax)" do
    stub_uri(:get, "/user/listFollowings/?username=pwaldhauer", "quotefm/user/listFollowings.json")
    response = Quotefm::User.listFollowings "pwaldhauer"
    response['totalCount'].should == "141"
  end

  it "should get a users followers by username (new Syntax)" do
    stub_uri(:get, "/user/listFollowers/?username=pwaldhauer", "quotefm/user/listFollowers.json")
    response = Quotefm::User.listFollowersByUsername "pwaldhauer"
    response['totalCount'].should == "464"
  end

  it "should get a users followings by user id" do
    stub_uri(:get, "/user/listFollowings/?id=1", "quotefm/user/listFollowings.json")
    response = Quotefm::User.listFollowingsByID 1
    response['totalCount'].should == "141"
  end
end