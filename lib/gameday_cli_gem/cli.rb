class GamedayCliGem::CLI 

  def call  #Main program loop
     list_games
     menu
     goodbye
   end

 def list_games  #method will list all of the day's games, including score for completed/in-progress games
   puts "Today's Upcoming Games:"
   @games = GamedayCliGem::Game.today
 end

 def menu  #menu interface. navigates to individual games, or daily games listing
    input = nil
    while input != "exit"
      puts "Enter the number of the game you'd like more info on or type [List] to see the games again, or type [Exit] to leave."
      input = gets.chomp.downcase
      case input
      when "1"
        puts "More info on game 1"
      when "2"
        puts "More info on game 2"
      when "3"
        puts "More info on game 3"
      when "list"
        list_games
      when "exit"
        goodbye
        break
      else
        puts "Invalid choice - Please type [List] or [Exit]"
      end
    end
  end

def goodbye  #exit program method
  puts "See you tomorrow for the next game!"
end

   
end