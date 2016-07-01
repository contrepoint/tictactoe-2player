require 'rails_helper'

RSpec.describe Board, type: :model do
  before :each do
    @board = FactoryGirl.create(:new_board)
    @full_board = FactoryGirl.create(:full_board_tie)
  end

  describe "a newly created board" do
    it "winning_marker should be nil" do
      expect(@board.winning_marker).to eq(nil)
    end

    it "board state should be '---------'" do
      expect(@board.state).to eq('---------')
    end
  end

  describe "check whether a cell is empty" do
    it "should return true for an empty cell" do
      expect(@board.empty_cell?(rand(0..8))).to eq(true)
    end

    it "should return false for a non-empty cell" do
      expect(@full_board.empty_cell?(rand(0..8))).to eq(false)
    end
  end

  describe "mark the spot on an empty cell" do
    it "should change the board state by marking the spot" do
      expect{@board.mark_the_spot(4, 'x')}.to change{@board.state[4]}.from('-').to('x')
    end
    @board = Board.create
  end
end
