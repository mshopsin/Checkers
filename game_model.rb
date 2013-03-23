require './token'

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
		possible.select! {|move| token.capture_piece?(move)}
		possible
	end

	def double_jump(token)
		!token.nil? && token.piece_taken && capture_moves(token).length > 0
	end
end
