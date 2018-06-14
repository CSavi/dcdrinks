class Dcdrinks::Venue

  attr_accessor :name, :location, :time, :feature, :url


  def initialize
  end

  def self.day
    #Scrape dchappyhours and return list based on that data
    self.scrape_venues
  end

  def self.scrape_venues
    venues = []
    #Go to dchappyhours and find the venue
    #Extract data or properties
    #Instantiate a happy hour

    #return array of happy hours
  end

  def self.new
  end
end
