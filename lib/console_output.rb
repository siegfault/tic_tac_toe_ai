class ConsoleOutput
  def initialize(board:)
    @board = board
  end

  def print
    output_progress

    if board.matching_on_any_rows?
      output_win
    elsif board.filled_out?
      output_tie
    end
  end

  private
  attr_reader :board

  def output_win
    puts 'winner!'
  end

  def output_tie
    puts 'tie!'
  end

  def output_progress
    output_row_for([:top_left, :top_middle, :top_right])
    output_bars
    output_row_for([:middle_left, :middle_middle, :middle_right])
    output_bars
    output_row_for([:bottom_left, :bottom_middle, :bottom_right])
  end

  def output_row_for(locations)
    puts locations.map { |loc| format(board.space_for(loc)) }.join(' | ')
  end

  def output_bars
    puts '--|---|--'
  end

  def format(space)
    if space.cross?
      'X'
    elsif space.naught?
      'O'
    else
      ' '
    end
  end
end
