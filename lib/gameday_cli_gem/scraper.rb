require_relative '../gameday_cli_gem.rb'

class GamedayCliGem::Scraper

  def get_page 
    Nokogiri::HTML(open("http://www.si.com/scoreboard"))
  end 

  def scrape_games_index 
    self.get_page.css("div.game")
    binding.pry
  end 

  def make_games
    #teams_playing = self.get_page.css("div.game")[0].css("span").text[/\b\S*\z/]
    # teams_playing = "#{team_1} vs #{team_2}" 
    # team_1 = self.get_page.css("div.media-body")[0].css("span").text
    # team_2 = self.get_page.css("div.media-body")[1].css("span").text
  end

end

kek = GamedayCliGem::Scraper.new 
kek.scrape_games_index