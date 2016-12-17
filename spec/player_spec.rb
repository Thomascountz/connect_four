require_relative 'spec_helper'

RSpec.describe 'Player' do
  describe '#initialize' do
    it 'sets @name' do
      player = Player.new(name: 'Thomas')
      name = player.instance_variable_get(:@name)
      expect(name).to eq('Thomas')
    end

    it 'sets @token' do
      player = Player.new(token: 'X')
      token = player.instance_variable_get(:@token)
      expect(token).to eq('X')
    end
  end
end
