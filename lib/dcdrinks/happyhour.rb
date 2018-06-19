class Dcdrinks::HappyHour

  attr_accessor :name, :location, :day, :time, :feature, :url

  @@all = []


  def initialize(name, location, time, feature, url)
    @name = name
    @location = location
    @time = time
    @feature = feature
    @url = url
    @@all_venues << self
  end

  def self.all
    @@all
  end

  def self.day_selector(selected_day)
    @venues_for_day = selected_day
  end

  def self.scrape_dchappyhours
    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@venues_for_day}"))  #this changes based off selected day
    happyhour = doc.css("h2.card-title").text
    binding.pry
    #search through venues for happyhour text
    #if includes happyhour text
      #scrape new page (Nokokgiri:HTML(open))
      #create happyhour objects from the table
        #store details: location, day, times
    happyhour.collect do |hh|
      name = hh.search("").text
      location = hh.search("a").attribute("href").text
      time = hh.search().text
      feature = hh.search().text
      url = hh.search().text
   end
  end
end
