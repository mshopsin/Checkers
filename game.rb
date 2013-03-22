require './board'
require './player'

class Game
	attr_accessor :board, :player1, :player2
	def initialize
		@board = Board.new
		@player1 = Human.new(:black,self.board)
		@player2 = Human.new(:red,self.board)
	end

	def start_game
		while true
			round
		end
	end

	def round
		self.board.display
		puts "Player: #{self.player1.color}"
		self.player1.take_turn
		self.board.display
		puts "Player: #{self.player2.color}"
		self.player2.take_turn
	end

end

g = Game.new

g.start_game