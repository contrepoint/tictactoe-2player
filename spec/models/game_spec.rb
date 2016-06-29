require 'rails_helper'

RSpec.describe Game, type: :model do
  before :each do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user2)
    @game = FactoryGirl.create(:game)
  end

  it "sets board_id after Game is created" do
    expect(@game.board_id).to eq(@game.id)
  end

  it "has a board, a 'challenger' user and a 'challenged' user" do
    expect(@game.board).to be_a(Board)
    expect(@game.challenger).to be_a(User)
    expect(@game.challenged).to be_a(User)
  end
end
