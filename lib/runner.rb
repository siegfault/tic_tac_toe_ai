require_relative './game'
require_relative './console_input'
require_relative './console_output'
require_relative './computer_player'
require_relative './human_player'

board = Board.new
output = ConsoleOutput.new(board: board)
input = ConsoleInput.new
cross = ComputerPlayer.new(mark: :cross, input_device: nil, output_device: nil)
naught = HumanPlayer.new(mark: :naught, input_device: input, output_device: output)

game = Game.new(board: board, player_cross: cross, player_naught: naught, output_device: output)
game.play
