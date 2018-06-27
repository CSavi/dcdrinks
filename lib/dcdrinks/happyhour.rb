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
    #this method will return an array of happy hour objects that include the location we pass in
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
    #temp array
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
    #self.scrape_dchappyhours.each.with_index(1) {|hh, i| puts "#{i}. #{hh[:name]} - #{hh[:location].strip} - #{hh[:time].strip} - #{hh[:feature]}"}
  end


  # def self.scrape_dchappyhours
  #   happyhour_array = []
  #
  #   doc = Nokogiri::HTML(open("https://www.dchappyhours.com/index.phtml?selectarea=&selectday=#{@happyhour_for_day}"))
  #   happyhours = doc.css(".card-block")
  #   happyhours.collect do |details|
  #     if details.css("p.card-text").text.include?("Happy Hour")
  #
  #       happyhour_hash = {
  #         :name => details.css("h2.card-title").text.strip,
  #         :location => details.css("p.card-text span[1]").text.strip,
  #         :time => details.css("p.card-text span[3]").text.strip,
  #         :feature => details.css("p.card-text span.hhlistingtext").text.strip
  #       }
  #       happyhour_array << happyhour_hash
  #     end
  #   end
  #   happyhour_array
  # end
end
