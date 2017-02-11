class GamedayCliGem::Game 

  attr_accessor :teams_playing, :league, :team1, :team2, :start_time, :preview_url

  @@all = []

  def initialize(team1 = nil, team2 = nil, league = nil, start_time = nil, preview_url = nil)
    @team1 = team1 
    @team2 = team2
    @league = league 
    @start_time = start_time
    @preview_url = preview_url
    self.class.all << self 
  end

  def self.new_from_index_page(game)
    self.new(
      game.css("div.media-body")[0].css("span").text,
      game.css("div.media-body")[1].css("span").text,
      game[0].attribute("data-league").text,
      game.css(".status-pregame")[0].text.gsub(" ", "").gsub(/\n/, "")
      )
    end
      
  def self.all 
    @@all 
  end

  def self.find(index)
    self.all[index-1]
  end

  def teams_playing
    @teams_playing = "#{@team_1} vs. #{@team_2}" 
  end

  def league 
    #@league = self.get_page.css("div.game")[0].attribute("data-league").text
  end
   
end

