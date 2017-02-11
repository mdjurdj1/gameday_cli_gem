class GamedayCliGem::Game 

  attr_accessor :name, :team1, :team2, :start_time, :ongoing, :preview

  @@all = []

  def initialize(name)
    @name = name 
  end

  def self.all 
    @@all 
  end

  def self.today 
    #should return all of today's games in an array
    game_1 = self.new
    game_1.name = "Heat vs Knicks"
    game_1.start_time = "9:00pm"
    game_1.ongoing = false
    game_1.preview_url = "http://www.si.com/nhl/game/1646895"

    game_2 = self.new
    game_2.name = "Cavs vs Thunder"
    game_2.start_time = "9:00pm"
    game_2.ongoing = false
    game_2.preview_url = "http://www.si.com/nhl/game/1646889"

    [game_1, game_2]
  end

end