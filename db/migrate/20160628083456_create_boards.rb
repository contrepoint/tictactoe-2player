class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :game_id, references: :games, null: false
      t.string :state, :default => '-' * 9
      t.string :winning_marker, :default => nil
      t.timestamps null: false
    end
  end
end
