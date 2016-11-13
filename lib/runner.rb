require_relative './game.rb'

board = Board.new
cross = ComputerPlayer.new(mark: :cross)
naught = ComputerPlayer.new(mark: :naught)

game = Game.new(board: board, player_cross: cross, player_naught: naught)
game.play
