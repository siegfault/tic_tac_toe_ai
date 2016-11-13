require_relative './game.rb'
require_relative './console_output.rb'

board = Board.new
output = ConsoleOutput.new(board: board)
cross = ComputerPlayer.new(mark: :cross)
naught = ComputerPlayer.new(mark: :naught)

game = Game.new(board: board, player_cross: cross, player_naught: naught, output_device: output)
game.play
