class Dcdrinks::Venue

  attr_accessor :name, :location, :time, :feature, :url

  @@all = []


  def self.day_selector(selected_day)
    @venue_day = selected_day
  end

  def self.scrape_venues  #scrapes list of venues
     venue_array = []
     venue_array << self.scrape_dchappyhours
    # doc = Nokogiri::HTML(open(https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Thursday&timerange=&metroline=&metrostation=&selectrating=&showall=No&showall=Yes&sortby=Name&resultsperpage=25)) #needs to change based off of selected day
    # filter = doc.search('filters')
    # venue_links = filter.search() #grab links within filter

    #Extract data or properties
    #Instantiate a happy hour
    #return array of happy hours
    venue_array
  end

  def self.scrape_dchappyhours
    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@venue_day}"))  #this changes based off selected day
    name = doc.css("h2.card-title").text

    location = doc.css("a").attribute("href").text
  end



end
