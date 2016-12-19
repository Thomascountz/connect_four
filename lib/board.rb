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

    count = 0

    4.times do |i|
      break if count == 4
      # this immediately breaks when column or row is 0
      break unless row + i <= 5 && row - i > 0 && column + i <= 6 && column - i > 0
      count += 1 if @play_area[row][column + i] == token
      count += 1 if @play_area[row][column - i] == token
      count += 1 if @play_area[row + i][column] == token
      count += 1 if @play_area[row - i][column] == token
    end

    count == 4 ? true : false
  end
end
