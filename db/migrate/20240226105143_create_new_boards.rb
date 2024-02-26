class CreateNewBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :new_boards do |t|

      t.timestamps
    end
  end
end
