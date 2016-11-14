require_relative './game'
Dir["./lib/players/*.rb"].each {|file| require file }
Dir["./lib/io_devices/*.rb"].each {|file| require file }

io_device = IoDevices::Console.new
cross_player_class = Players::Randomized
naught_player_class = Players::Randomized

Game.new(
  board: Board.new,
  io_device: io_device,
  player_cross: cross_player_class.new(mark: :cross, io_device: io_device),
  player_naught: naught_player_class.new(mark: :naught, io_device: io_device)
).play
