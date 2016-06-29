require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "GET #new" do
    it "shows the page to challenge a user to a new game" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    before :each do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user2)
      sign_in @user1
    end

    context "saves a game with valid attributes" do
      it "saves a new game to the database" do
        expect{
          post :create, { :user_email => @user2.email}
        }.to change(Game, :count).by(1)
        expect(flash[:notice]).to include(@user2.email)
      end

      it "redirects to show page" do
        post :create, { :user_email => @user2.email}
        expect(response).to redirect_to(new_game_path)
      end
    end

    context "with invalid attributes" do
      it "does not allow a user to challenge themselves" do
        expect{
          post :create, { :user_email => @user1.email }
        }.not_to change(Game, :count)
        expect(flash[:notice]).to include("challenge yourself")
      end

      it "does not allow a user to challenge users not in the database" do
        post :create, { :user_email => 'lorem ipsum'}
        expect(flash[:notice]).to include('lorem ipsum')
      end

      it "redirects to new game page" do
        emails = [@user1.email, 'lorem ipsum']
        emails.each do |e|
          post :create, { :user_email => e}
          expect(response).to redirect_to(new_game_path)
        end
      end
    end
  end
end
