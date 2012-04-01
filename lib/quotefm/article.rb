module Quotefm
  class Article

    def self.getByID id
      res = HTTParty.get("https://quote.fm/api/article/get/?id="+id.to_s)
    end

    def self.getByURL url
      res = HTTParty.get("https://quote.fm/api/article/get/?url="+url)
    end

    def self.listByPage id, options={}
      options = options.merge({:id => id})
      url = "https://quote.fm/api/article/listByPage/?"+options.to_param
      res = HTTParty.get(url)
    end

    def self.listByCategories ids, options={}
      options = options.merge({:ids => ids})
      url = "https://quote.fm/api/article/listByCategories/?"+options.to_param

      puts url

      res = HTTParty.get(url)
    end

  end
end