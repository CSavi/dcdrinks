class Dcdrinks::Venue

  attr_accessor :name, :location, :day, :time, :feature, :url

  @@all_venues = []


  def initialize(name, location, time, feature, url)
    @name = name
    @location = location
    @time = time
    @feature = feature
    @url = url
    @@all_venues << self
  end

  def self.all
    @@all_venues
  end

  def self.day_selector(selected_day)
    @venues_for_day = selected_day
  end

  def self.scrape_dchappyhours
    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@venues_for_day}"))  #this changes based off selected day
    venue = doc.css("h2.card-title").text
    binding.pry
    #search through venues for happyhour text
    #if includes happyhour text
      #scrape new page (Nokokgiri:HTML(open))
      #create happyhour objects from the table
        #store details: location, day, times
    venue.collect do |ven|
      name = ven.search("").text
      location = ven.search("a").attribute("href").text
      time = ven.search().text
      feature = ven.search().text
      url = ven.search().text
   end
  end
end
