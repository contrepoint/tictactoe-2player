class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @games_as_challenger = current_user.games_as_challenger
      @games_as_challenged = current_user.games_as_challenged
      @total_games = @games_as_challenger + @games_as_challenged
    end
  end
end
