class GamedayCliGem::CLI

  def call  #Main program loop
     GamedayCliGem::Scraper.new.make_games
     start
   end

  def list_games
      GamedayCliGem::Game.all.each.with_index(1) do |game, index|
        if !game.news_url.nil?
          puts "#{index}. | #{game.league} | #{game.team1} vs. #{game.team2} - #{game.start_time} - News Available"
        elsif game.start_time.length < 1  #Might be uneccessary, check if this procs during an ongoing game
          puts "#{index}. | #{game.league} | #{game.team1} vs. #{game.team2} - ONGOING "
        else
          puts "#{index}. | #{game.league} | #{game.team1} vs. #{game.team2} - #{game.start_time} "
        end
    end
  end

 def start  #menu interface. navigates to individual games, or daily games listing
     puts "-------------------"
     puts "Welcome to Gameday!"
     puts "-------------------"
     puts "Today is #{DateTime.now.strftime('%m/%d/%Y')} -"
     puts "Here are Today's Games:"
     puts
    list_games
    puts ""
    puts "Select any game with 'News Available' for more info. Or, type [Exit] to leave."
    input = gets.chomp.downcase
     if input == "exit"
       goodbye
     else
      system "clear"
        if GamedayCliGem::Game.find(input.to_i) && GamedayCliGem::Game.find(input.to_i).news_url.nil? #found game, but no news url to dig into
            puts "No news is currently available for that game. Please check back later tonight!"
            puts ""
            puts ""
            puts "------------------------------"
            puts "Press enter to return to main menu."
            input = gets.chomp
            start
        elsif !GamedayCliGem::Game.find(input.to_i) #did not find game by number
            puts "Invalid game selection! Please input a valid game number. [1 - #{GamedayCliGem::Game.all.length}]"
            puts ""
            puts ""
            puts "------------------------------"
            puts "Press enter to return to main menu."
            input = gets.chomp
            start
        elsif GamedayCliGem::Game.find(input.to_i) && !GamedayCliGem::Game.find(input.to_i).news_url.nil? #found game and it has a news_url to dig into
          game = GamedayCliGem::Game.find(input.to_i)
            puts "------------------------------"
            puts game.headline
            puts "------------------------------"
            game.final_score
            puts ""
            puts game.recap
            puts "------------------------------"
            puts "Enter [List] to return to today's games, or [Exit] to quit."
            input = gets.chomp.downcase
            case input
              when "list"
                system "clear"
                start
              when "exit"
                goodbye
              else
                system "clear"
                start
              end
            end
        end
  end

def goodbye  #exit program method
  system "clear"
  puts ""
  puts "See you tomorrow for the next game!"
  puts ""
  sleep 0.5
end


end
