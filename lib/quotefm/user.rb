module Quotefm
  class User

    def self.getByID id
      res = HTTParty.get("https://quote.fm/api/user/get/?id="+id.to_s)
    end

    def self.getByUsername username
      res = HTTParty.get("https://quote.fm/api/user/get/?username="+username.to_s)
    end

    def self.listFollowersByUsername username
      res = HTTParty.get("https://quote.fm/api/user/listFollowers/?username="+username.to_s)
    end

    def self.listFollowersByID id
      res = HTTParty.get("https://quote.fm/api/user/listFollowers/?id="+id.to_s)
    end

    def self.listFollowingsByUsername username
      res = HTTParty.get("https://quote.fm/api/user/listFollowings/?username="+username.to_s)
    end

    def self.listFollowingsByID id
      res = HTTParty.get("https://quote.fm/api/user/listFollowings/?id="+id.to_s)
    end

    #Comatibility to older Version
    def self.listFollowers username
      listFollowersByUsername username
    end

    def self.listFollowings username
      listFollowingsByUsername username
    end

  end
end