class Dcdrinks::HappyHour

  attr_accessor :name, :location, :time, :feature #:day?
#  BASE_PATH = "./dchappyhours.com/index.phtml?selectarea=&selectday"  => creates method for days' url?

  def initialize(name=nil, location=nil, time=nil, feature=nil)
    @name = name
    @location = location
    @time = time
    @feature = feature
  end

  urls = [

  ]


  # def self.day_selector(selected_day) # 1-7
  #   @happyhours_for_day = selected_day
  #   # OR scrape =>  doc = Nokogiri::HTML(open())
  #   # day = doc.css("div.row select option value")
  # end
  #
  # day_1 = self.new
  # day_1.name = "Monday"
  # day_1.url = "https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Monday"

  #scrape dchappyhours.com and then return happyhours based on that data
  def self.scrape_dchappyhours  # => should i add url arg here?
    happyhour_array = []

    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@happyhour_for_day}"))  #this changes based off selected day
    happyhours = doc.css(".card-block")

    happyhours.each do |details|
      if details.css("p.card-text").text.include?("Happy Hour")

        happyhour_hash = {
          :name => details.css("h2.card-title").text.strip,
          :location => details.css("p.card-text span[1]").text.strip,
          :time => details.css("p.card-text span[3]").text.strip,
          :feature => details.css("p.card-text span.hhlistingtext").text.strip
        }
        happyhour_array << happyhour_hash
        #binding.pry
      end
    end
    happyhour_array
    #happyhour = Dcdrinks::HappyHour.new  #create happyhour object
  end

  # def self.scrape_individual_happyhour(weekday_url = https://www.dchappyhours.com/bussinfo.phtml?buss=634&uname=1331+Bar+%26+Lounge)
  #   individual_happyhour_hash = {}
  #   doc = Nokokgiri::HTML(open(weekday_url))
  #   details = doc.css("")
  #     details.each do |d|
  #       sd = d.
end
