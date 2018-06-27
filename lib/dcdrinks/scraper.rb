

class Dcdrinks::Scraper

  def self.scrape_happyhours(day)
    #happyhour_array = []

    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/index.phtml?selectarea=&selectday=#{day}"))
    happyhours = doc.css(".card-block")
    happyhours.collect do |details|
      if details.css("p.card-text").text.include?("Happy Hour")

        happyhour_hash = {
          :name => details.css("h2.card-title").text.strip,
          :location => details.css("p.card-text span[1]").text.strip,
          :time => details.css("p.card-text span[3]").text.strip,
          :feature => details.css("p.card-text span.hhlistingtext").text.strip
        }
        Dcdrinks::HappyHour.new(happyhour_hash)
        #happyhour_array << happyhour_hash
      end
    end
  end

end
