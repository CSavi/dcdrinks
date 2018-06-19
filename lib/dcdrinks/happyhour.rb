class Dcdrinks::HappyHour

  attr_accessor :name, :location, :day, :time, :feature

  @@all = []


  def initialize(name, location, time, feature)
    @name = name
    @location = location
    @time = time
    @feature = feature
    @@all << self
  end

  def self.all
    @@all
  end

  def self.day_selector(selected_day)
    @happyhours_for_day = selected_day
  end

  def Monday
  end

  def Tuesday
  end

  def self.scrape_dchappyhours
    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@happyhours_for_day}"))  #this changes based off selected day
    happyhours = doc.css(".card-block")
      if happyhours.include?("h2 p.card-text").text
        happyhours.collect do |details|
          name = details.search().text
          location = details.search().text
          time = details.search().text
          feature = details.search().text
        end
      end    

              self.new(name, location, time, url)

    binding.pry
    #search through venues for happyhour text
      #scrape new page (Nokokgiri:HTML(open))
      #create happyhour objects from the table
        #store details: location, day, times


    # happyhour.collect do |hh|
    #   name = hh.search("").text
    #   location = hh.search("a").attribute("href").text
    #   time = hh.search().text
    #   feature = hh.search().text
    #   url = hh.search().text
   end
  end
end
