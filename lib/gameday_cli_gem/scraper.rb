require_relative '../gameday_cli_gem.rb'

class GamedayCliGem::Scraper

  def get_page 
    Nokogiri::HTML(open("http://www.si.com/scoreboard"))
  end 

  def scrape_games_index 
      self.get_page.css("div.game")
  end 

  def make_games
     scrape_games_index.each do |game|
        GamedayCliGem::Game.new_from_index_page(game)
      end
  end

end
