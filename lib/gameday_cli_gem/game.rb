class GamedayCliGem::Game

  attr_accessor :league, :team1, :team2, :start_time, :recap_url, :headline

  @@all = []

  def initialize(team1 = nil, team2 = nil, league = nil, start_time = nil, recap_url = nil)
    @team1 = team1
    @team2 = team2
    @league = league
    @start_time = start_time
    @recap_url = recap_url
    self.class.all << self unless self.class.all.include?(self)
  end

  def self.new_from_index_page(game) # IT #%@KING WORKED THANK GOD
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
      self.all[index.to_i-1]
  end

  def recap  #puts a truncated recap article to terminal
    puts doc.css(".article p")[0].text
    puts doc.css(".article p")[1].text
    puts doc.css(".article p")[2].text
    puts doc.css(".article p")[3].text
  end

  def final_score  #puts the final score of a completed game
    puts "Final Score >> #{doc.css(".team-name")[0].text}: #{doc.css(".team-score")[0].text.strip} || #{doc.css(".team-name")[1].text}: #{doc.css(".team-score")[1].text.strip}"
  end

  def headline  #headline selector from doc
    @headline = doc.css(".article h1").text
  end

  def doc  #document of the recap_url for games with an available recap
    Nokogiri::HTML(open(self.recap_url))
  end


end
