require_relative './game.rb'
require_relative './console_output.rb'
require_relative './computer_player.rb'
require_relative './human_player.rb'

board = Board.new
output = ConsoleOutput.new(board: board)
cross = ComputerPlayer.new(mark: :cross)
naught = HumanPlayer.new(mark: :naught)

game = Game.new(board: board, player_cross: cross, player_naught: naught, output_device: output)
game.play
