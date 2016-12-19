require_relative 'board'
require_relative 'player'

# game logic for connect four
class Game
  def initialize(args = {})
    @board = Board.new
    @player_x = args.fetch(:player_x, nil)
    @player_o = args.fetch(:player_o, nil)
    @current_player = [@player_x, @player_o].sample
  end

  def prompt
    puts "#{@current_player.name}, it's your turn."
    puts "Enter the column number where you'd like to play #{@current_player.token}."
    @board.display

    column = get_input

    until column && play = @board.play(column: column, token: @current_player.token)
      puts "Sorry, that's not an option."
      column = get_input
    end

    game_won if @board.win?(play)
    game_tied if @board.tied?

    @current_player = switch_players

    puts "\n"

    prompt
  end

  def get_input
    column = gets.chomp.to_i
    input_valid?(column) ? column : false
  end

  def input_valid?(input)
    begin
      input = Integer(input)
    rescue ArgumentError
      return false
    end

    input.between?(1, 7) ? true : false
  end

  def switch_players
    return @player_x if @current_player == @player_o
    return @player_o if @current_player == @player_x
  end

  def game_won
    puts "Congratulations, #{@current_player.name}, you've won the game!"
    @board.display
    exit
  end

  def game_tied
    puts "There's no winner. The game is tied."
    @board.display
  end
end

player_x = Player.new(name: 'Thomas', token: 'X')
player_o = Player.new(name: 'Chris', token: 'O')
Game.new(player_x: player_x, player_o: player_o)
