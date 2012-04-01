module Quotefm
  class Page
    def self.getByID id
      res = HTTParty.get("https://quote.fm/api/page/get/?id="+id.to_s)
    end

    def self.getByDomain domain
      res = HTTParty.get("https://quote.fm/api/page/get/?domain="+domain.to_s)
    end

    def self.list
      res = HTTParty.get("https://quote.fm/api/page/list")
    end
  end
end