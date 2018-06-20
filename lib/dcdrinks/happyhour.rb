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
      @happyhours_for_day = "Monday"
      puts "You selected Monday."
    elsif selected_day == "2"
      @happyhours_for_day = "Tuesday"
      puts "You selected Tuesday."
    elsif selected_day == "3"
      @happyhours_for_day = "Wednesday"
      puts "You selected Wednesday."
    elsif selected_day == "4"
      @happyhours_for_day = "Thursday"
      puts "You selected Thursday."
    elsif selected_day == "5"
      @happyhours_for_day = "Friday"
      puts "You selected Friday."
    elsif selected_day == "6"
      @happyhours_for_day = "Saturday"
      puts "You selected Saturday."
    elsif selected_day == "7"
      @happyhours_for_day = "Sunday"
      puts "You selected Sunday."
    else
      puts "Selection invalid. Please select numbers 1-7."
    end
  end

  #scrape dchappyhours.com and then return happyhours based on that data
  def self.scrape_dchappyhours  # => should i add url arg here?
    happyhour_array = []

    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/index.phtml?selectarea=&selectday=/#{@happyhours_for_day}"))  #this changes based off selected day
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
