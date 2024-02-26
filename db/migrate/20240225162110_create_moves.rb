class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.references :board, null: false, foreign_key: true
      t.integer :x
      t.integer :y
      t.string :player

      t.timestamps
    end
  end
end
