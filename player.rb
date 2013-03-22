require './board'
require './token'
class Player
	attr_reader :color
	attr_accessor :board
	def initialize(color,board)
		@color = color
		@board = board
	end

	def take_turn
		raise 'Not implemented'
	end
end

class Human < Player
	def initialize(color,board)
		super(color,board)
	end

	def take_turn
		invalid_move = false
		until invalid_move
			puts "please enter:x1,y1,x2,y2"
			move_text = gets.chomp
			move = move_text.split(',')
			move.map!(&:to_i)
			invalid_move = move_my_piece(move)
			puts "Invalid Move try again" unless invalid_move
		end
	end
	
	#[x1,y1,x2,y2]
	def move_my_piece(move)
		return self.board.move_player_piece(move,self)
	end

end