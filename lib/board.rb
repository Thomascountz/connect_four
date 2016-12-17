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

end

