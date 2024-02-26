class Game < ApplicationRecord
    has_one :board, dependent: :destroy
    after_create :create_board

    private

    def create_board
       self.build_board(size: size)
    end 
end