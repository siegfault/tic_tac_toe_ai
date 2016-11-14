require_relative './game'
require_relative './io_devices/console'
require_relative './players/randomized'
require_relative './players/human'

board = Board.new
console = IoDevices::Console.new
cross = Players::Randomized.new(mark: :cross, io_device: console)
naught = Players::Human.new(mark: :naught, io_device: console)

game = Game.new(board: board, player_cross: cross, player_naught: naught, io_device: console)
game.play
