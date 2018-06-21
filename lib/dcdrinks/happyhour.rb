class Dcdrinks::HappyHour

  attr_accessor :name, :location, :time, :feature

  def initialize(name:, location:, time:, feature:)
    @name = name
    @location = location
    @time = time
    @feature = feature
  end


  def self.day_selector(selected_day)
    if selected_day == "1"
      @happyhour_for_day = "Monday"
    elsif selected_day == "2"
      @happyhour_for_day = "Tuesday"
    elsif selected_day == "3"
      @happyhour_for_day = "Wednesday"
    elsif selected_day == "4"
      @happyhour_for_day = "Thursday"
    elsif selected_day == "5"
      @happyhour_for_day = "Friday"
    elsif selected_day == "6"
      @happyhour_for_day = "Saturday"
    elsif selected_day == "7"
      @happyhour_for_day = "Sunday"
    end
  end

  #scrape dchappyhours.com and then return happyhours based on that data
  def self.scrape_dchappyhours  # => should i add url arg here?
    happyhour_array = []

    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/index.phtml?selectarea=&selectday=/#{@happyhour_for_day}"))  #this changes based off selected day
    happyhours = doc.css(".card-block")

    happyhours.collect do |details|
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
end
