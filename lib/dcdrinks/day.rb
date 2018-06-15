class Dcdrinks::Day


  def self.list_days  #from cli
    self.scrapped_day_list
  end

  def self.scrapped_day_list
    day_array = []
    day_page = Nokogiri::HTML(open("https://www.dchappyhours.com"))
    day_names = day_page.find()  #what are we finding on page?
    day_names.each do |day| day_array << day
    end
    day_array #returns array
  end


end
