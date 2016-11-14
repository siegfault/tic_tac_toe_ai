require_relative './game'
require_relative './console_input'
require_relative './console_output'
require_relative './players/randomized'
require_relative './players/human'

board = Board.new
output = ConsoleOutput.new
input = ConsoleInput.new
cross = Players::Randomized.new(mark: :cross, input_device: nil, output_device: nil)
naught = Players::Human.new(mark: :naught, input_device: input, output_device: output)

game = Game.new(board: board, player_cross: cross, player_naught: naught, output_device: output)
game.play
