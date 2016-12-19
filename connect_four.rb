require './lib/player.rb'
require './lib/game.rb'
puts '----------CONNECT 4----------'
puts 'Please enter your names.'
puts 'Player 1: '
name = gets.chomp
player_x = Player.new(name: name, token: 'X')
puts 'Player 2: '
name = gets.chomp
player_o = Player.new(name: name, token: 'O')
game = Game.new(player_x: player_x, player_o: player_o)
puts 'Enjoy the game!'
game.prompt
