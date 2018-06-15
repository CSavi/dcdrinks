class Dcdrinks::Venue

  attr_accessor :name, :location, :time, :feature, :url


  def self.day_selector(selected_day)
    @venue_day = selected_day
  end

  def self.scrape_venues  #scrapes list of venues 
    venue_array = []
    doc = Nokogiri::HTML(open(https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Thursday&timerange=&metroline=&metrostation=&selectrating=&showall=No&showall=Yes&sortby=Name&resultsperpage=25)) #needs to change based off of selected day
    filter = doc.search('filters')
    venue_links = filter.search() #grab links within filter
    #Extract data or properties
    #Instantiate a happy hour

    #return array of happy hours
  end

  def self.new
  end
end
