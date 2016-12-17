require_relative 'spec_helper'

describe 'Board' do
  
  let(:board) { Board.new }

  describe '#initializes' do
    
    it 'sets @play_area' do
      expect(board).to respond_to(:play_area)
    end
  end  
    
  describe "@play_Area" do
      it 'is an array' do
        expect(board.play_area).to be_kind_of(Array)
      end

      it 'has six rows' do
        expect(board.play_area.size).to eq(6)
      end

      it 'has seven columns' do
        expect(board.play_area[0].size).to eq(7)
      end
    
  end
  

  describe '#play' do
  
    context 'when the column is empty' do
      it 'places a value in the bottom row of a given column' do
        board.play(5)
        expect(board.play_area[5][4]).to eq("X")
      end
    end
    
    context "when the column is not empty" do
      it 'places a value in the first empty row' 
    end
  end
end


# [[nil, nil, nil, nil, nil, nil, nil],
# [nil, nil, nil, nil, nil, nil, nil],
# [nil, nil, nil, nil, nil, nil, nil],
# [nil, nil, nil, nil, nil, nil, nil],
# [nil, nil, nil, nil, nil, nil, nil],
# [nil, nil, nil, nil, nil, nil, nil]]