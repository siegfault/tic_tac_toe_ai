require 'row'
require 'space'

class Board
  def initialize(rows: nil, spaces: nil)
    @spaces = spaces || create_spaces
    @rows   = rows   || create_rows
  end

  def matching_on_any_rows?
    rows.any?(&:complete?)
  end

  def filled_out?
    spaces.all?(&:occupied?)
  end

  private
  attr_reader :rows, :spaces

  def create_rows
    [
      top_row,
      middle_horizontal_row,
      bottom_row,
      left_row,
      middle_vertical_row,
      right_row,
      back_slash_row,
      forward_slash_row
    ]
  end

  def create_spaces
    [
      top_left_space,    top_middle_space,    top_right_space,
      middle_left_space, middle_middle_space, middle_right_space,
      bottom_left_space, bottom_middle_space, bottom_right_space
    ]
  end

  def top_row
    @top_row ||= Row.new(
      top_left_space,
      top_middle_space,
      top_right_space
    )
  end

  def middle_horizontal_row
    @middle_horizontal_row ||= Row.new(
      middle_left_space,
      middle_middle_space,
      middle_right_space
    )
  end

  def bottom_row
    @bottom_row ||= Row.new(
      bottom_left_space,
      bottom_middle_space,
      bottom_right_space
    )
  end

  def left_row
    @left_row ||= Row.new(
      top_left_space,
      top_left_space,
      top_left_space
    )
  end

  def middle_vertical_row
    @middle_vertical_row ||= Row.new(
      top_middle_space,
      middle_middle_space,
      bottom_middle_space
    )
  end

  def right_row
    @right_row ||= Row.new(
      top_right_space,
      middle_right_space,
      bottom_right_space
    )
  end

  def back_slash_row
    @back_slash_row ||= Row.new(
      top_left_space,
      middle_middle_space,
      bottom_right_space
    )
  end

  def forward_slash_row
    @forward_slash_row ||= Row.new(
      bottom_left_space,
      middle_middle_space,
      top_right_space
    )
  end

  def top_left_space
    @top_left_space ||= Space.new(location: :top_left)
  end

  def top_middle_space
    @top_middle_space ||= Space.new(location: :top_middle)
  end

  def top_right_space
    @top_right_space ||= Space.new(location: :top_right)
  end

  def middle_left_space
    @middle_left_space ||= Space.new(location: :middle_left)
  end

  def middle_middle_space
    @middle_middle_space ||= Space.new(location: :middle_middle)
  end

  def middle_right_space
    @middle_right_space ||= Space.new(location: :middle_right)
  end

  def bottom_left_space
    @bottom_left_space ||= Space.new(location: :bottom_left)
  end

  def bottom_middle_space
    @bottom_middle_space ||= Space.new(location: :bottom_middle)
  end

  def bottom_right_space
    @bottom_right_space ||= Space.new(location: :bottom_right)
  end
end
