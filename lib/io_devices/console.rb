module IoDevices
  class Console
    def get
      gets.chomp
    end

    def print_moves(available_moves)
      puts available_moves.join(' ')
    end

    def print_board(marks:)
      puts format_marks(marks: marks)
    end

    def print_winner(player)
      puts 'winner!'
    end

    def print_tie
      puts 'tie!'
    end

    private
    attr_reader :board

    def format_marks(marks:)
      marks.each_slice(3).map { |triplet| triplet.join(' | ') }.join("\n#{bars}\n")
    end

    def bars
      '--|---|--'
    end
  end
end
