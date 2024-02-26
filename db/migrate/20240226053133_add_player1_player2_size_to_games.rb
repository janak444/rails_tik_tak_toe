class AddPlayer1Player2SizeToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :player1, :string
    add_column :games, :player2, :string
    add_column :games, :size, :integer
  end
end
