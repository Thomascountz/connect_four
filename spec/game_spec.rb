require_relative 'spec_helper'

RSpec.describe Game do
  describe '#initialize' do
    it 'initializes a Board and sets it to @board' do
      game = Game.new
      board = game.instance_variable_get(:@board)
      expect(board).to be_kind_of(Board)
    end
    
    it 'accepts two Players and sets them to @player_x and @player_o' do
      player1 = Player.new(name: 'John Smith', token: 'X')
      player2 = Player.new(name: 'Jill Smith', token: 'O') 
 
      game = Game.new(player_x: player1, player_o: player2)
      
      player_o = game.instance_variable_get(:@player_x)
      player_x = game.instance_variable_get(:@player_x)
      
      expect(player_x).to be_kind_of(Player)
      expect(player_o).to be_kind_of(Player)
    end
    
    it 'sets @current_player to either @player_x or @player_o randomly' do
      player1 = double('player')
      player2 = double('player')
      
      game = Game.new(player_x: player1, player_o: player2)
      
      current_player = game.instance_variable_get(:@current_player)
      
      expect(current_player).to eq(player1).or(eq(player2))

    end
  end
  
  describe '#input_valid?' do
    it 'returns true if the argument is an integer between zero and six' do
      game = Game.new
      expect(game.input_valid?(2)).to be true
    end
    
    it 'returns false if the argument is an integer not between zero and six' do
      game = Game.new
      expect(game.input_valid?(8)).to be false
      expect(game.input_valid?(18)).to be false
    end
  end
  
  describe '#switch_players' do
    it 'sets @current_player to @player_x if it is @player_o' do
      player_x = double('player')
      player_o = double('player')
      game = Game.new(player_x: player_x, player_o: player_o)
      game.instance_variable_set(:@current_player, player_o)
      current_player = game.switch_players
      expect(current_player).to eq(player_x)
    end
    
    it 'sets @current_player to @player_o if it is @player_x' do
      player_x = double('player')
      player_o = double('player')
      game = Game.new(player_x: player_x, player_o: player_o)
      game.instance_variable_set(:@current_player, player_x)
      current_player = game.switch_players
      expect(current_player).to eq(player_o)
    end
  end
end