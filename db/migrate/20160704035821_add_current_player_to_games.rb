class AddCurrentPlayerToGames < ActiveRecord::Migration
  def change
    add_column :games, :winner_id, :integer, references: :users
    add_column :games, :active_player_id, :integer, references: :users
  end
end
