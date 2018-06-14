class Dcdrinks::Scraper

  def get_page
    Nokogiri::HTML(open())
  end

  def scrape_happy_hours_index
    self. #get_page.css()
  end

  def make_happy_hours

  end
end
