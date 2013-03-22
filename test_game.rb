#test game
require './board'
require './player'

board = Board.new
player1 = Human.new(:black,board)
player2 = Human.new(:red,board)
board.display
player1.move_my_piece([1,2,2,3])
board.display
player2.move_my_piece([0,5,1,4])
board.display
player1.move_my_piece([3,2,4,3])
board.display
player2.move_my_piece([1,4,0,3])
board.display