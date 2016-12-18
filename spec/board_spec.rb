require_relative 'spec_helper'

describe 'Board' do
  let(:board) { Board.new }

  describe '#initializes' do
    it 'sets @play_area' do
      expect(board).to respond_to(:play_area)
    end
  end

  describe '@play_Area' do
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
      it 'places a token in the bottom row of a given column' do
        board.play(5)
        expect(board.play_area[5][4]).to eq('X')
      end
    end

    context 'when the column is not empty' do
      it 'places a token in the first empty row' do
        board.instance_variable_set(:@play_area,
                                    [['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', 'O', '.', '.'],
                                     ['.', '.', '.', '.', 'O', '.', '.']])
        board.play(5)
        expect(board.play_area[3][4]).to eq('X')
      end
    end

    context 'when the column is full' do
      it 'returns nil' do
        board.instance_variable_set(:@play_area,
                                    [['.', '.', '.', '.', 'X', '.', '.'],
                                     ['.', '.', '.', '.', 'O', '.', '.'],
                                     ['.', '.', '.', '.', 'O', '.', '.'],
                                     ['.', '.', '.', '.', 'O', '.', '.'],
                                     ['.', '.', '.', '.', 'X', '.', '.'],
                                     ['.', '.', '.', '.', 'O', '.', '.']])
        expect(board.play(5)).to be_nil
      end
    end
  end

  describe '#win?' do
    context 'when there are four concecutive tokens in a horizontal row' do
      it 'returns true' do
        board.instance_variable_set(:@play_area,
                                    [['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', 'X', 'X', 'X', 'X', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.']])
        expect(board.win?(token: 'X', row: 3, column: 3)).to be true
      end
    end
    context 'when there are four concecutive tokens in a vertical row' do
      it 'returns true' do
        board.instance_variable_set(:@play_area,
                                    [['.', '.', 'X', '.', '.', '.', '.'],
                                     ['.', '.', 'X', '.', '.', '.', '.'],
                                     ['.', '.', 'X', '.', '.', '.', '.'],
                                     ['.', '.', 'X', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.']])
        expect(board.win?(token: 'X', row: 1, column: 2)).to be true
      end
    end
    context 'when there are four concecutive tokens in a diagonal row' do
      it 'returns true on positive diagonals' do
        board.instance_variable_set(:@play_area,
                                    [['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', 'X', '.', '.'],
                                     ['.', '.', '.', 'X', '.', '.', '.'],
                                     ['.', '.', 'X', '.', '.', '.', '.'],
                                     ['.', 'X', '.', '.', '.', '.', '.']])
        expect(board.win?(token: 'X', row: 4, column: 2)).to be true
      end
      it 'returns true on negative diagonals' do
        board.instance_variable_set(:@play_area,
                                    [['.', '.', '.', '.', '.', '.', '.'],
                                     ['.', 'X', '.', '.', '.', '.', '.'],
                                     ['.', '.', 'X', '.', '.', '.', '.'],
                                     ['.', '.', '.', 'X', '.', '.', '.'],
                                     ['.', '.', '.', '.', 'X', '.', '.'],
                                     ['.', '.', '.', '.', '.', '.', '.']])
        expect(board.win?(token: 'X', row: 2, column: 2)).to be true
      end
    end
    context 'when there are not four concecutive tokens in a row' do
      it 'returns false' do
        board.instance_variable_set(:@play_area,
                                    [['.', 'X', 'O', '.', 'O', '.', '.'],
                                     ['.', 'X', 'X', 'O', 'O', '.', '.'],
                                     ['.', 'O', 'X', 'O', 'X', '.', 'X'],
                                     ['X', 'X', 'X', 'O', 'X', '.', 'O'],
                                     ['O', 'O', 'O', 'X', 'O', 'O', 'O'],
                                     ['O', 'X', 'X', 'X', 'O', 'X', 'O']])
        expect(board.win?(token: 'X', row: 3, column: 3)).to be false
      end
    end
  end
end
