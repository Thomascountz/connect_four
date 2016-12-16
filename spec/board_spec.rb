require_relative 'spec_helper'

describe 'Board' do

  describe '#new' do
    before(:each) do
      @board = Board.new
    end
    
    context 'creates a game board play area' do
      it 'instantiates play_area' do
        expect(@board).to respond_to(:play_area)
      end
      
      it 'is an array' do
        expect(@board.play_area).to be_kind_of(Array)
      end

      it 'has six rows' do
        expect(@board.play_area.size).to eq(6)
      end

      it 'has seven columns' do
        expect(@board.play_area[0].size).to eq(7)
      end
    end
  end
end

# let(:board) { double( 'Board' ) }
# let(:play_area) { [[nil, nil, nil, nil, nil, nil, nil],
#                   [nil, nil, nil, nil, nil, nil, nil],
#                   [nil, nil, nil, nil, nil, nil, nil],
#                   [nil, nil, nil, nil, nil, nil, nil],
#                   [nil, nil, nil, nil, nil, nil, nil],
#                   [nil, nil, nil, nil, nil, nil, nil]] }

# before(:each) do
#   allow(Board).to receive(:play_area).and_return(:play_area)
# end
