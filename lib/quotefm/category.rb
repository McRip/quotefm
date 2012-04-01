module Quotefm
  class Category
    def self.list
      res = HTTParty.get("https://quote.fm/api/category/list")
    end
  end
end