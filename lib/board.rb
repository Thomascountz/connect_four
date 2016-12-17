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

  def win?
  end

  def diagonal_pos(row, column, token)
    count = 1 if @play_area[row][column] == token
    new_row = row
    new_column = column

    until @play_area[new_row][new_column] != token
      new_row -= 1
      new_column += 1
      count += 1
      return count if count == 4
    end

    new_row = row
    new_column = column

    until @play_area[new_row][new_column] != token
      new_row += 1
      new_column -= 1
      count += 1
      return count if count == 4
    end

    count
  end
end
