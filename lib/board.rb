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
      7.times do |column|
        play_area[row] << "#{row + 1}-#{column + 1}"
      end
    end
    play_area
  end

  def display
    print " 1    2    3    4    5    6    7 \n"
    6.times do |row|
      7.times do |column|
        print "#{@play_area[row][column]}  "
      end
      print "\n"
    end
    nil
  end

  def play(column)
    @play_area[5][column - 1] = 'X'
  end
end
