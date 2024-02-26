class BoardsController < ApplicationController
    def show
        @game = Game.find(params[:id])
        @board = @game.board
      end
end
