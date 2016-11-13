require_relative './game.rb'
require_relative './console_input.rb'
require_relative './console_output.rb'
require_relative './computer_player.rb'
require_relative './human_player.rb'

board = Board.new
output = ConsoleOutput.new(board: board)
input = ConsoleInput.new
cross = ComputerPlayer.new(mark: :cross, input_device: nil, output_device: nil)
naught = HumanPlayer.new(mark: :naught, input_device: input, output_device: output)

game = Game.new(board: board, player_cross: cross, player_naught: naught, output_device: output)
game.play
