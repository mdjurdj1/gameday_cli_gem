class GamedayCliGem::CLI 

  def call  #Main program loop
     GamedayCliGem::Scraper.new.make_games
     puts "-------------------"
     puts "Welcome to Gameday!"
     puts "-------------------"
     puts "Today is #{DateTime.now.strftime('%m/%d/%Y')} -"
     puts "Here are Today's Games:"
     puts 
     start
   end

  def list_games
      GamedayCliGem::Game.all.each_with_index do |game, index|
        if !game.recap_url.nil?
          puts "#{index+1}. | #{game.league} | #{game.team1} vs. #{game.team2} - FIN - Recap Available"
        elsif game.start_time.length < 1
          puts "#{index+1}. | #{game.league} | #{game.team1} vs. #{game.team2} - FIN "
        else
          puts "#{index+1}. | #{game.league} | #{game.team1} vs. #{game.team2} - #{game.start_time} " 
        end
    end

  end 
   
 def start  #menu interface. navigates to individual games, or daily games listing
    list_games
    puts ""
    # input = nil
    # while input != "exit"
    puts "Select any game with a 'Recap Available' for more info. Or, type [Exit] to leave."
    input = gets.chomp.downcase
      system "clear"
      game = GamedayCliGem::Game.find(input.to_i)
      puts "------------------------------"
      puts game.headline 
      puts "------------------------------"
      puts ""
      puts game.recap

  end

def goodbye  #exit program method
  puts "See you tomorrow for the next game!"
end

   
end