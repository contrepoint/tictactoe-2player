require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "a newly created board" do
    before :each do
      @board = FactoryGirl.create(:new_board)
    end

    it "winning_marker should be nil" do
      expect(@board.winning_marker).to eq(nil)
    end

    it "board state should be '---------'" do
      expect(@board.state).to eq('---------')
    end
  end

  describe "marking a spot" do
    context "should first check whether a cell is empty" do
      it "should return true for an empty cell" do
        @board = FactoryGirl.create(:new_board)
        expect(@board.empty_cell?(rand(0..8))).to eq(true)
      end

      it "should return false for a non-empty cell" do
        @board_tie = FactoryGirl.create(:board_tie)
        expect(@board_tie.empty_cell?(rand(0..8))).to eq(false)
      end
    end

    context "should mark the spot on an empty cell" do
      it "should change the board state by marking the spot" do
        @board = FactoryGirl.create(:new_board)
        expect{@board.mark_the_spot(4, 'x')}.to change{@board.state[4]}.from('-').to('x')
      end
    end
  end

  describe "endgame states" do
    it "board is won and full." do
      @full_board_won = FactoryGirl.create(:full_board_won)
      expect(@full_board_won.full?).to eq(true)
      expect(@full_board_won.won?).to eq(true)
      expect(@full_board_won.tie?).to eq(false)
    end

    it "board is won and not full. game over." do
      @non_full_board_won = FactoryGirl.create(:non_full_board_won)
      expect(@non_full_board_won.full?).to eq(false)
      expect(@non_full_board_won.won?).to eq(true)
      expect(@non_full_board_won.tie?).to eq(false)
    end

    it "board is tied. game over" do
      @board_tie = FactoryGirl.create(:board_tie)
      expect(@board_tie.full?).to eq(true)
      expect(@board_tie.won?).to eq(false)
      expect(@board_tie.tie?).to eq(true)
    end
  end
end