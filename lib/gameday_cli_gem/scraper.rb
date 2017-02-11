require_relative '../gameday_cli_gem.rb'

class GamedayCliGem::Scraper

  def get_page 
    Nokogiri::HTML(open("http://www.si.com/scoreboard"))
  end 

  def scrape_games_index 
    self.get_page.css("div.score-tile-large")
  end 

  def make_games
    #team1 = self.get_page.css("div.score-tile-large").first.css("a").children.css("span").children[0].text
    #team1_record = self.get_page.css("div.score-tile-large").first.css("a").children.css("span").children[1].text.gsub("(", "")
    #team2 = self.get_page.css("div.score-tile-large").first.css("a").children.css("span").children[4].text
    #team2_record = self.get_page.css("div.score-tile-large").first.css("a").children.css("span").children[5].text.gsub("(", "")
    
  end

end

kek = GamedayCliGem::Scraper.new 
kek.scrape_games_index