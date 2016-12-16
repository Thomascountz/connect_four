require_relative 'spec_helper'

describe 'Board' do
  before(:each) do
    @board = Board.new
  end

  describe '#new' do
    context 'calls create_play_area' do
      it 'creates an array #play_area' do
        expect(@board.play_area).to be_a(Array)
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
