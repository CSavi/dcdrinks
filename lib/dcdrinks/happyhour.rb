class Dcdrinks::HappyHour

  attr_accessor :name, :location, :time, :feature #:day?
#  BASE_PATH = "./dchappyhours.com/index.phtml?selectarea=&selectday"  => creates method for days' url?

  def initialize(name=nil, location=nil, time=nil, feature=nil)
    @name = name
    @location = location
    @time = time
    @feature = feature
  end


  # def self.day_selector(selected_day) # 1-7
  #   @happyhours_for_day = selected_day
  #   # OR scrape =>  doc = Nokogiri::HTML(open())
  #   # day = doc.css("div.row select option value")
  # end
  #
  # day_1 = self.new
  # day_1.name = "Monday"
  # day_1.url = "https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Monday"


  def self.scrape_dchappyhours  # => should i add url arg here?
    happyhour_array = []

    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@happyhours_for_day}"))  #this changes based off selected day
    happyhours = doc.css(".card-block")

    happyhours.each do |details|
      if details.css("p.card-text").text.include?("Happy Hour")

        happyhour_hash = {
          :name => details.css("h2.card-title").text,  #"h2.card-title a "
          :location => details.css("p.card-text").text,
          :time => details.css("p.card-text").text, #"p.card-text span[1]"    #how to iterate the values for location, time, feature
          :feature => details.css("p.card-text span.hhlistingtext").text
        }
        happyhour_array << happyhour_hash
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


    #search through venues for happyhour text
      #scrape new page (Nokokgiri:HTML(open))
      #create happyhour objects from the table
        #store details: location, day, times
