module Quotefm
  class Recommendation

    def self.get id
      res = HTTParty.get("https://quote.fm/api/recommendation/get/?id="+id.to_s)
    end

    def self.listByArticle id, options={}
      options = options.merge({:id => id})
      url = "https://quote.fm/api/recommendation/listByArticle/?"+options.to_param
      res = HTTParty.get(url)
    end

    def self.listByUser username, options={}
      options = options.merge({:username => username})
      url = "https://quote.fm/api/recommendation/listByUser/?"+options.to_param
      res = HTTParty.get(url)
    end
  end
end