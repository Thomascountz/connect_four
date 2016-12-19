require 'pry'
# Connectfour game board array and methods
class Board
  attr_reader :play_area

  def initialize
    @play_area = create_play_area
  end

  def create_play_area
    play_area = []
    6.times do |row|
      play_area << []
      7.times do |_column|
        play_area[row] << '.'
      end
    end
    play_area
  end

  def display
    print "1  2  3  4  5  6  7 \n"
    6.times do |row|
      7.times do |column|
        print "#{@play_area[row][column]}  "
      end
      print "\n"
    end
    nil
  end

  def play(args = {})
    token   = args.fetch(:token, nil)
    column  = args.fetch(:column, nil)

    row = 5
    column -= 1

    until @play_area[row][column] == '.'
      row -= 1
      return false if row < 0
    end

    @play_area[row][column] = token

    { token: token, row: row, column: column }
  end

  def win?(args = {})
    token   = args.fetch(:token, nil)
    row     = args.fetch(:row, nil)
    column  = args.fetch(:column, nil)

    horizontal_win?(token: token, row: row, column: column) ||
      vertical_win?(token: token, row: row, column: column) ||
      diagonal_win?(token: token, row: row, column: column)
  end

  def horizontal_win?(args = {})
    token   = args.fetch(:token, nil)
    row     = args.fetch(:row, nil)
    column  = args.fetch(:column, nil)

    count = 0

    4.times do |i|
      count += 1 if column + i <= 6 && @play_area[row][column + i] == token
      count += 1 if column - i >= 0 && @play_area[row][column - i] == token
      return true if count == 5
    end

    false
  end

  def vertical_win?(args = {})
    token   = args.fetch(:token, nil)
    row     = args.fetch(:row, nil)
    column  = args.fetch(:column, nil)

    count = 0

    4.times do |i|
      # binding.pry
      count += 1 if row + i <= 5 && @play_area[row + i][column] == token
      count += 1 if row - i >= 0 && @play_area[row - i][column] == token
      return true if count == 5
    end

    false
  end

  def diagonal_win?(args = {})
    token   = args.fetch(:token, nil)
    row     = args.fetch(:row, nil)
    column  = args.fetch(:column, nil)

    count = 0

    4.times do |i|
      # binding.pry
      count += 1 if row + i <= 5 && column - i >= 0 && @play_area[row + i][column - i] == token
      count += 1 if row - i >= 0 && column + i <= 6 && @play_area[row - i][column + i] == token
      return true if count == 5
    end

    count = 0

    4.times do |i|
      # binding.pry
      count += 1 if row + i <= 5 && column + i <= 6 && @play_area[row + i][column + i] == token
      count += 1 if row - i >= 0 && column - i >= 0 && @play_area[row - i][column - i] == token
      return true if count == 5
    end

    false
  end
end
