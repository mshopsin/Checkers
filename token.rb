class Token
	attr_reader :color

	attr_reader :status #Draughts_Man,Draughts_King
	attr_accessor :board, :x, :y
	def initialize(color,x,y,board)
		@color = color
		@x = x
		@y = y
		@board = board
		@status = :Draughts_Man
	end

	def get_char
		out_chr = "  "
		if status == :Draughts_Man
			out_chr = "\u25CF "
		else
			out_chr = "K "
		end
		out_chr
	end

	def valid_move(targ_x,targ_y)
		raise 'exeception not implemented'
	end

	def move_piece(move)
		return false unless is_diag_move?(move) && is_destination_open?(move)
		puts "reached take"
		take_piece?(move)
		puts "in token #{move}"
		self.board[self.y][self.x] = nil
		puts "in token #{self.board[y][x]}"
		self.x,self.y = move[2],move[3]
		puts "setting x,y"
		self.board[self.y][self.x] = self
		puts self.board[self.y][self.x]
		return true
	end

	def is_diag_move?(move)
		puts "is diag"
		(move[0] - move[2]).abs == (move[1] - move[3]).abs ? true : false
	end

	def is_destination_open?(move)
		puts "is open"
		self.board[move[3]][move[2]] == nil ? true : false
	end

	#return true or false, this determines if jump is one space or two
	def take_piece?(move)
		dx = move[0] - move[2]
		dy = move[1] - move[3]
		puts "dy #{dy} dx #{dx}"
		if dx.abs == 2 && dy.abs == 2
			x = dx / 2
			y = dy / 2
			enemy_token = self.board[move[0] + y][move[1] + x]
			puts enemy_token
			if enemy_token != nil && enemy_token.color != self.color
				self.board[move[0] + y][move[1] + x] = nil
				puts "removed"
				return true
			end

		end
		puts "never removed"
		false
	end

	def promote
	end

end