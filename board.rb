require './token.rb'
require 'colorize'

class Board
	attr_accessor :board, :tokens, :game_model
	def initialize
		@board = []
		@tokens = []
		@game_model = Game_Model.new
		8.times do |i|
			row = [nil,nil,nil,nil,nil,nil,nil,nil]
			self.board << row
		end
		setup_black_tokens
		setup_white_tokens
	end

	def setup_black_tokens
		4.times do |i|
			3.times do |y|
				x = y % 2 == 0 ? 1 + i * 2 : i * 2
				self.tokens << Token.new(:black,x,y,self.board)
				self.board[y][x] = self.tokens.last
			end
		end
	end

	def setup_white_tokens
		4.times do |i|
			3.times do |j|
				x = j % 2 == 0 ? i * 2 : i * 2 + 1
				y = j + 5
				self.tokens << Token.new(:red,x,y,self.board)
				self.board[y][x] = self.tokens.last
			end
		end
	end
	#.colorize(:background=>black_white(
	def display
		puts " 0 1 2 3 4 5 6 7"
		self.board.each_with_index do |row,y|
			print "#{y}" 
			row.each_with_index do |cell,x|
				if cell.class == Token
					if (y+x) % 2 == 0
						print cell.get_char.colorize(:background=>:white, :color=>cell.color)
					else
						print cell.get_char.colorize(:background=>:green, :color=>cell.color)
					end
				elsif (y+x) % 2 == 0
					print "  ".colorize(:background=>:white)
				else
					print "  ".colorize(:background=>:green)
				end
			end
			print "\n"
		end
	end

	def move_player_piece(move,player)
		
		start_x, start_y = move[0], move[1]
		
		match_token = nil
		self.tokens.each do |token|
			
			if token.x == start_x && token.y == start_y && player.color == token.color
				match_token = token
				break
			end
			return false if token.x == start_x && token.y == start_y && player.color != token.color
		end
		game_model.valid_moves(match_token)
		return match_token.move_piece(move) unless match_token.nil?
		return false
	end

	def check_token(move,player,token)

	end

end

class Game_Model

	def valid_moves(token)
		moves = []
		8.times do |x|
			8.times do |y|
				move = [token.x,token.y,x,y]
				moves << move if token.valid_move?(move)
			end
		end
		moves
	end

	def capture_moves(token)
		possible = valid_moves(token)
		possible.select {|move| token.capture_piece?(move)}
		possible
	end

	def double_jump(token)
		token.piece_taken && capture_moves(token).length > 0
	end
end






