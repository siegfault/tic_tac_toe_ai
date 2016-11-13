require_relative './player.rb'

class HumanPlayer < Player
  def move(available_moves)
    puts available_moves.join(' ')
    until available_moves.include?(input = gets.chomp.to_sym)
      puts available_moves.join(' ')
    end
    input.to_sym
  end
end
