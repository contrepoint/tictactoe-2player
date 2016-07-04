require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  before(:each) do
    @game = FactoryGirl.create(:game)
    @position = 1 # rand(0..8)
  end

  describe "GET #show" do
    it "finds the appropriate board and renders it" do
      # @game = FactoryGirl.create(:game)
      get :show, id: @game.id
      expect(response).to render_template("show")
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      it "changes the board state" do
        patch :update, {:id => @game.id, :position => @position }
        a = @game.board.reload
        expect(a.state[@position.to_i]).to eq('x')
      end

      it "redirects to board#show with the appropriate flash" do
        patch :update, {:id => @game.id, :position => @position }
        expect(response).to redirect_to @game.board
        expect(flash[:notice]).to include("successfully")
      end
    end

    # test broken due to
    # context "with invalid attributes" do
    #   before(:each) do
    #     @full_board_game = FactoryGirl.create(:full_board_game)
    #   end
    #
    #   it "does not change the board state" do
    #     @game.board.state = "abcdefghi" # full board with nonsense info
    #     @game.save
    #     expect{
    #       patch :update, {:id => @full_board_game.id, :position => @position }
    #     }.to_not change{@full_board_game.board.state[@position.to_i]}
    #     # byebug
    #   end
    #
    #   it "redirects to board#show with the appropriate flash" do
    #     @game.board.state = "abcdefghi" # full board with nonsense info
    #     @game.save
    #     subject { patch :update, {:id => @full_board_game.id, :position => @position } }
    #     expect(subject).to redirect_to(@full_board_game.board)
    #     expect(flash[:notice]).to include("already taken")
    #   end
    # end
  end
end