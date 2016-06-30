require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  before(:each) do
    @board = FactoryGirl.create(:new_board)
    @full_board = FactoryGirl.create(:full_board_tie)
    @position = rand(0..8)
  end

  describe "GET #show" do
    it "finds the appropriate board and renders it" do
      get :show, id: @board.id
      expect(response).to render_template("show")
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      it "changes the board state" do
        patch :update, {:id => @board.id, :position => @position }
        @board.reload
        expect(@board.state[@position.to_i]).to eq('x')
      end

      it "redirects to board#show with the appropriate flash" do
        patch :update, {:id => @board.id, :position => @position }
        expect(response).to redirect_to @board
        expect(flash[:notice]).to include("successfully")
      end
    end

    context "with invalid attributes" do
      it "does not change the board state" do
        expect{
          patch :update, {:id => @full_board.id, :position => @position }
        }.to_not change{@full_board.state[@position.to_i]}
      end

      it "redirects to board#show with the appropriate flash" do
        patch :update, {:id => @full_board.id, :position => @position }
        expect(response).to redirect_to @full_board
        expect(flash[:notice]).to include("already taken")
      end
    end
  end
end
