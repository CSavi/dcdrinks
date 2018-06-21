class Dcdrinks::HappyHour

  attr_accessor :name, :location, :time, :feature
  @@all = []


  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
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


  def self.create_dchappyhour
    self.scrape_dchappyhours.each.with_index(1) {|hh, i| puts "#{i}. #{hh[:name]} - #{hh[:location].strip} - #{hh[:time].strip} - #{hh[:feature]}"}
  end


  def self.scrape_dchappyhours
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
      end
    end
    happyhour_array
  end
end
