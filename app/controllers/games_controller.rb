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

  def show
    @game = Game.find(params[:id])
  end

  def update
    if @game = Game.find(params[:id])
      if @game.challenged_user_marker != nil
        redirect_to board_path(params[:id])
        flash[:notice] = "Your opponent has already chosen their marker. The game has now started"
      elsif is_user_in_game?
        define_markers(chosen_marker = params[:marker])
      else
        redirect_to root_path
        flash[:notice] = "You are not in this game!"
      end
    else
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "Game with ID #{params[:id]} not found."
        redirect_to root_path
    end
  end

  private
    def set_attributes(challenged_user)
      @game = Game.new do |g|
        g.challenged = challenged_user
        g.challenger = current_user
        g.status = 'challenge accepted' # until I add the feature to accept challenges
      end
      @game.save
    end

    # Selecting Markers
    def is_user_in_game?
      return current_user == @game.challenger || current_user == @game.challenged
    end

    def define_markers(chosen_marker)
      if chosen_marker == 'x'
        other_marker = 'o'
        save_selected_markers(chosen_marker, other_marker)
      elsif chosen_marker == 'o'
        other_marker = 'x'
        save_selected_markers(chosen_marker, other_marker)
      else
        redirect_to game_path(params[:id])
        flash[:notice] = "That is not a valid marker"
      end
    end

    def save_selected_markers(chosen_marker, other_marker)
      if current_user == @game.challenger
        @game.challenger_user_marker = chosen_marker
        @game.challenged_user_marker = other_marker
      else current_user == @game.challenged
        @game.challenged_user_marker = chosen_marker
        @game.challenger_user_marker = other_marker
      end
      @game.status = 'game in progress'
      @game.save
      @game.select_who_starts
      redirect_to board_path(params[:id])
      flash[:notice] = "You set your marker to #{chosen_marker}. Your opponent's marker is #{other_marker}. #{@game.active_player.email}  was randomly chosen to start the game."
    end
end
