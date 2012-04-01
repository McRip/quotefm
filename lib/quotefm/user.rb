module Quotefm
  class User

    def self.getByID id
      res = HTTParty.get("https://quote.fm/api/user/get/?id="+id.to_s)
    end

    def self.getByUsername username
      res = HTTParty.get("https://quote.fm/api/user/get/?username="+username.to_s)
    end

    def self.listFollowers username
      res = HTTParty.get("https://quote.fm/api/user/listFollowers/?username="+username.to_s)
    end

    def self.listFollowings username
      res = HTTParty.get("https://quote.fm/api/user/listFollowings/?username="+username.to_s)
    end

  end
end