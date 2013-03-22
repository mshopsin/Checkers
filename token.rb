class Token
	attr_reader :color

	attr_reader :status #Draughts_Man,Draughts_King
	attr_accessor :board, :x, :y
	attr_reader :piece_taken
	def initialize(color,x,y,board)
		@color = color
		@x = x
		@y = y
		@board = board
		@status = :Draughts_Man
		@piece_taken = false
	end

	def get_char
		out_chr = "  "
		if status == :Draughts_Man
			out_chr = "\u25CF "
		else
			out_chr = "\u25C9 "
		end
		out_chr
	end

	def valid_move(targ_x,targ_y)
		raise 'exeception not implemented'
	end

	def move_piece(move)
		return false unless valid_move?(move)
		promote(move)
		@piece_taken = false
		@piece_taken = take_piece?(move)
		self.board[self.y][self.x] = nil
		self.x,self.y = move[2],move[3]
		self.board[self.y][self.x] = self
		puts self.board[self.y][self.x]
		return true
	end

	def valid_move?(move)
		if ((!capture_piece?(move) && (move[0]-move[2]).abs == 1) ||
		   (capture_piece?(move) && (move[0]-move[2]).abs == 2) )&&
		   (is_diag_move?(move) && is_destination_open?(move))

			return true
		end
		false
	end

	def is_diag_move?(move)
		(move[0] - move[2]).abs == (move[1] - move[3]).abs ? true : false
	end

	def is_destination_open?(move)
		self.board[move[3]][move[2]] == nil ? true : false
	end

	def capture_piece?(move)
		dx = move[2] - move[0] 
		dy = move[3] - move[1]
		if dx.abs == 2 && dy.abs == 2
			dx /= 2
			 dy /= 2
			enemy_token = self.board[move[1] + dy][move[0] + dx]
			if enemy_token != nil && enemy_token.color != self.color
				return true
			end
		end
		false
	end

	#return true or false, this determines if jump is one space or two
	def take_piece?(move)
		dx = move[2] - move[0] 
		dy = move[3] - move[1]
		puts "dy #{dy} dx #{dx}"
		if dx.abs == 2 && dy.abs == 2
			dx /= 2
			 dy /= 2
			enemy_token = self.board[move[1] + dy][move[0] + dx]
			if enemy_token != nil && enemy_token.color != self.color
				self.board[move[1] + dy][move[0] + dx] = nil
				@piece_taken = true
				puts "removed"
				return true
			end

		end
		false
	end

	def promote(move)
		if move[3] == 0 || move[3] == 7
			@status =:Draughts_King
		end
	end

end