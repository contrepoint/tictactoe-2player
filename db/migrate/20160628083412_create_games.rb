class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :challenger_id, references: :users, null: false
      t.references :challenged_id, references: :users, null: false
      t.integer :board_id, references: :boards
      t.timestamps null: false
    end
  end
end
