class TicTacToe

attr_accessor :name 

def initialize
	puts "hello , Welcome to Tic Tac Toe"
	puts "What is your name"
	@name = gets.chomp 
	puts "hello #{@name} , Good Luck!"
end

def startGame
	@arr  =[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @pnum = []
    @botnum = []
    gamewin = false
    endgame = false 
    gamectr = 1

   until endgame == true
		playernum
		botnum
		if gamectr > 2
		   if gamecheck == true
		      gamewin = true
		   else
		      puts "Its a tie game! Awesome"
		   end
		   endgame = true
		end
		gamectr += 1  
   end
end

def playernum
	valid = false
	until valid == true
		puts "#{@name} , please select a number from 1 - 9"
		input = gets.chomp.to_i
		if @pnum.include?(input) || @botnum.include?(input)
	 	    puts  "Duplicate number , please try again"
		elsif input == 0 || input > 9
			puts "Invalid or Out of Range Number"
		else
			@pnum << input
			puts @pnum.to_s
			valid = true 
    	end
    end
end

def botnum
	valid = false
	until valid == true
		rnum = rand(9)
		if @pnum.include?(rnum) || @botnum.include?(rnum)
	 	   #repeat
	    elsif rnum == 0 || rnum > 9
	       #select another number
	    else
			@botnum << rnum
			puts @botnum.to_s
			valid = true 
    	end
	end
end

def gamecheck

   @arr.each do |a|
	 if a.to_s == @pnum.sort.to_s
	    puts "Awesome!! You won the game #{@name}"
	    return true
	 elsif a.to_s == @botnum.sort.to_s
	    puts "Nice Try! The Bot won this time #{@name}"
	    return true
	 end
   end
end

end
a = TicTacToe.new
a.startGame
