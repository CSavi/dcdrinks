class Dcdrinks::HappyHour

  attr_accessor :name, :location, :time, :feature, :day
  @@all = []


  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end


  def self.all
    @@all
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


  def self.find_by_location(location_string)
    #this method will return an array of happy hour objects that include the location passed in
    hh_location_array = []
    self.all.each do |hh|
      if hh.location.include?(location_string)
        hh_location_array << hh
      end
    end
    hh_location_array
  end


  def self.find_by_name(name)
    #this method will return an array of happy hour objects that include the name we pass in
    #temp_array = []
    happyhour_array = []
    self.all.each do |hh|
      if hh.name.include?(name)
        happyhour_array << hh
      end
    end
    happyhour_array
  end


  def self.create_dchappyhour
    @@all = []
    Dcdrinks::Scraper.scrape_happyhours(@happyhour_for_day)
  end
end
