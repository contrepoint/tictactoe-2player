require 'rails_helper'

RSpec.describe Board, type: :model do
  before :each do
    @board = Board.create
  end

  it "winning_marker should be nil" do
    expect(@board.winning_marker).to eq(nil)
  end

  it "board state should be '---------'" do
    expect(@board.state).to eq('---------')
  end
end
