class GamedayCliGem::Scraper

  def get_page 
    Nokogiri::HTML(open("http://www.si.com/scoreboard"))
  end 


end