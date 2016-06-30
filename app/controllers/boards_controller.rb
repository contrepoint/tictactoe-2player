class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id]).state.split('')
  end

  def update
    # first, check that it is the player's turn
    @board = Board.find(params[:id])
    position = params[:position].to_i
    if @board.empty_cell?(position)
      # eventually, 'x' will be the person's marker
      @board.mark_the_spot(position, 'x')
      # switch_player_turns
      flash[:notice] = "You successfully placed your marker at position #{position}!"
    else
      flash[:notice] = "Position #{position} is already taken!"
    end
    redirect_to board_path(params[:id])
  end

end
