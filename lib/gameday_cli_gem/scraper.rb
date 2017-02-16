require_relative '../gameday_cli_gem.rb'

class GamedayCliGem::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.si.com/scoreboard"))#
  end

  def scrape_games_index
      self.get_page.css("div.game")
  end

  def make_games  #creates game instances from the scraped XML based on selector availability
     scrape_games_index.each do |game|
       if game.css(".game-link").text == "Preview"  #selects for upcoming games with previews
        GamedayCliGem::Game.new(
           game.css("div.media-body")[0].css("span").text,
           game.css("div.media-body")[1].css("span").text,
           game.attribute("data-league").text.upcase,
           game.css(".status-pregame").text.gsub(" ", "").gsub(/\n/, ""),
            "http://www.si.com#{game.css(".game-link").attribute("href").text}"
           )
       elsif game.css(".game-link").text.include?("Recap")  #selects for games with recap, which must be finished
           GamedayCliGem::Game.new(
           game.css("div.media-body")[0].css("span").text,
           game.css("div.media-body")[1].css("span").text,
           game.attribute("data-league").text.upcase,
           "FIN",
           "http://www.si.com#{game.css(".game-link").attribute("href").text}"
           )
       elsif game.at_css(".status-pregame")  #selects for games with a visible start time
            GamedayCliGem::Game.new(
            game.css("div.media-body")[0].css("span").text,
            game.css("div.media-body")[1].css("span").text,
            game.attribute("data-league").text.upcase,
            game.css(".status-pregame").text.gsub(" ", "").gsub(/\n/, "")
            )
       elsif game.at_css(".status-active")  #selects for games which are active
             GamedayCliGem::Game.new(
             game.css("div.media-body")[0].css("span").text,
             game.css("div.media-body")[1].css("span").text,
             game.attribute("data-league").text.upcase,
             game.css(".status-active").text.gsub(/\s+/, "").split("|").join("| ")
             )
        elsif game.at_css(".status-final") #selects for any other completed games with no recap/preview or start time
             GamedayCliGem::Game.new(
             game.css("div.media-body")[0].css("span").text,
             game.css("div.media-body")[1].css("span").text,
             game.attribute("data-league").text.upcase,
             "FIN"
             )
           end
      end
  end

end
