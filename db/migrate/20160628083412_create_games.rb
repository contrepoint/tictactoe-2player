class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :challenger, references: :users, null: false
      t.references :challenged, references: :users, null: false
      t.integer :board_id, references: :boards
      t.timestamps null: false
    end
  end
end
