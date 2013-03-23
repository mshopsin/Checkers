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
player1.move_my_piece([4,3,4,3])
board.display
player2.move_my_piece([6,5,5,4])
board.display
player1.move_my_piece([7,2,6,3])
board.display
player2.move_my_piece([5,4,3,2])
board.display
#testing for king
player1.move_my_piece([2,1,1,2])
board.display
player2.move_my_piece([7,6,6,5])
board.display
player1.move_my_piece([1,0,2,1])
board.display
player2.move_my_piece([3,2,1,0])
board.display
player2.move_my_piece([1,0,2,1])
board.display
board = Board.new
player1 = Human.new(:black,board)
player2 = Human.new(:red,board)
player1.move_my_piece([1,2,2,3])
board.display
player2.move_my_piece([6,5,7,4])
board.display
player1.move_my_piece([7,2,6,3])
board.display
player2.move_my_piece([7,6,6,5])
board.display
player1.move_my_piece([2,1,1,2])
board.display
player2.move_my_piece([6,7,7,6])
board.display
player1.move_my_piece([3,0,2,1])
board.display
player2.move_my_piece([2,5,1,4])
board.display
player1.move_my_piece([5,2,4,3])
board.display
player2.move_my_piece([7,4,5,2])
board.display
player2.move_my_piece([5,2,3,0])
board.display
player1.move_my_piece([4,3,3,4])
board.display
player2.move_my_piece([3,0,4,1])
board.display



