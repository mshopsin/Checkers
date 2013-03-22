require './token.rb'
require 'colorize'

class Board
	attr_accessor :board, :tokens
	def initialize
		@board = []
		@tokens = []
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
		self.board.each_with_index do |row,y|
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
				puts "match"
				break
			end
			return false if token.x == start_x && token.y == start_y && player.color != token.color
		end
		puts match_token
		return match_token.move_piece(move) unless match_token.nil?
		puts "fail"
		return false
	end

	def check_token(move,player,token)

	end

end







