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

  def play(column)
    row = 5
    column -= 1

    until @play_area[row][column] == '.'
      row -= 1
      return nil if row < 0
    end

    @play_area[row][column] = 'X'
  end

  def win?(token, row = 0, column = 0, count = 0)
    return true if count == 4
    return if !row.between?(0, 5) && !column.between?(0, 6)

    # checks for horizontal wins
    win?(token, row += 1, column = 0, count = 0) if column > 6
    if @play_area[row][column] == token
      win?(token, row, column += 1, count += 1)
    else
      win?(token, row, column += 1, count)
    end
  end
end
