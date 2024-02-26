class GamesController < ApplicationController
  def new
    @game = Game.new
   
    # puts "@board: #{@board.inspect}" 
    # @board = Board.new(params[:size].to_i)
  end
  
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to board_path(@game)
    else
      render :new
    end
  end

  def board
    @game = Game.find(params[:id])
    size = params[:game][:size].to_i
    @board = Board.new(size)
  
  end

  def end_game
  
    @state = State.new(@game.board)
    result = @state.evaluate(@game.board)


    redirect_to game_path(@game)
  end   
  
  private

  def game_params
    params.require(:game).permit(:player1, :player2, :size)
  end

end
