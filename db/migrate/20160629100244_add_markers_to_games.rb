class AddMarkersToGames < ActiveRecord::Migration
  def change
    add_column :games, :challenger_user_marker, :string
    add_column :games, :challenged_user_marker, :string
    add_column :games, :status, :string
  end
end
