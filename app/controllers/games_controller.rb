class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    if @challenged_user = User.find_by(email: params[:user_email])
      if @challenged_user == current_user
        redirect_to new_game_path
        flash[:notice] = "did you just try to challenge yourself to a game!?!?"
      else
        set_attributes(@challenged_user)
        redirect_to new_game_path
        flash[:notice] = "whee! you challenged #{params[:user_email]} to a game!"
      end
    else
      redirect_to new_game_path
      flash[:notice] = "oops! We couldn't find the user with the email #{params[:user_email]}."
    end
  end

  private
    def game_params
      params.require(:game).permit(:challenger)
    end

    def set_attributes(challenged_user)
      @game = Game.new do |g|
        g.challenged = challenged_user
        g.challenger = current_user
      end
      @game.save
    end
end
