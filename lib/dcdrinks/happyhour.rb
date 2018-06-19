class Dcdrinks::HappyHour

  attr_accessor :name, :location, :day, :time, :feature


  # def self.day_selector(selected_day) # 1-7
  #   @happyhours_for_day = selected_day
  #   # OR scrape =>  doc = Nokogiri::HTML(open())
  #   # day = doc.css("div.row select option value")
  # end
  #
  # day_1 = self.new
  # day_1.name = "Monday"
  # day_1.url = "https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Monday"
  #
  # day_2 = self.new
  # day_2.name = "Tuesday"
  # day_2.url = "https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Tuesday"
  #
  # day_3 = self.new
  # day_3.name = "Wednesday"
  # day_3.url = "https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Wednesday"

  def Monday
    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/index.phtml?selectarea=&selectday=Monday"))
    puts doc
  end


  def self.scrape_dchappyhours
    doc = Nokogiri::HTML(open("https://www.dchappyhours.com/#{@happyhours_for_day}"))  #this changes based off selected day
    happyhours = doc.css(".card-block")
    #  if happyhours.css(".card-text br 'Happy Hour: '")
    happyhours.each do |details|
      happyhour = Dcdrinks::HappyHour.new
      happyhour.name = details.css("h2.card-title").text  #"h2.card-title a "
      happyhour.location = details.css("p.card-text").text  #"p.card-text span[0]"
      happyhour.time = details.css("p.card-text").text #"p.card-text span[1]"
      happyhour.feature = details.css("p.card-text span.hhlistingtext").text
    end
  end
end


    #search through venues for happyhour text
      #scrape new page (Nokokgiri:HTML(open))
      #create happyhour objects from the table
        #store details: location, day, times
