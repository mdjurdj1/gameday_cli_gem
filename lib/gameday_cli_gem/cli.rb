class GamedayCliGem::CLI 

  def call  #Main program loop
     list_games
     menu
     goodbye
   end

 def list_games  #method will list all of the day's games, including score for completed/in-progress games
   puts "Today's Upcoming Games:"
   @games = Gameday::Games.today
 end

   
end