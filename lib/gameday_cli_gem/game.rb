class GamedayCliGem::Game 

  attr_accessor :league, :team1, :team2, :start_time, :recap_url

  @@all = []

  def initialize(team1, team2, league, start_time = nil, recap_url = nil)
    @team1 = team1 
    @team2 = team2
    @league = league 
    @start_time = start_time
    @recap_url = recap_url
    self.class.all << self unless self.class.all.include?(self)
  end

  def self.new_from_index_page(game) # IT FUCKING WORKED THANK GOD
    if game.at_css(".game-link")
      self.new(
        game.css("div.media-body")[0].css("span").text,
        game.css("div.media-body")[1].css("span").text,
        game.attribute("data-league").text.upcase,
        game.css(".status-pregame").text.gsub(" ", "").gsub(/\n/, ""),
         "http://www.si.com#{game.css(".game-link").attribute("href").text}"
        )
     else 
       self.new(
         game.css("div.media-body")[0].css("span").text,
         game.css("div.media-body")[1].css("span").text,
         game.attribute("data-league").text.upcase,
         game.css(".status-pregame").text.gsub(" ", "").gsub(/\n/, "")
         )
       end
    end
      
  def self.all 
    @@all 
  end

  def self.find(index)
    self.all[index-1]
  end

  def recap_urlz
    doc
  end

  def doc
    Nokogiri::HTML(open("http://www.si.com/scoreboard"))
  end 

   
end

