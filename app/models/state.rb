class State < ApplicationRecord
    def initialize(board)
        @board = board
      end
    
      def wins(board,player)
        win_state = []
        n = board.size - 1
            for i in 0..n
              row =[]
              for j in 0..n
                row << board.cell_value(i,j)
              end
            win_state << row
            end
            for i in 0..n
              column = []
              for j in 0..n
                column << board.cell_value(j,i)
              end
              win_state << column
            end
            diagonal1 =[]
            for i in 0..n
              for j in 0..n
                if i==j
                 diagonal1 << board.cell_value(i,j)  
                end
              end
            end
            win_state << diagonal1
            diagonal2 = []
            for i in 0..n
              for j in 0..n
                if i+j==n
                diagonal2 << board.cell_value(i,j)
                end  
              end
            end
            win_state << diagonal2
    
        win_state.include? Array.new(board.size, player)
      end
    
      def game_over
        wins(@board, Player::PLAYER1) || wins(@board, Player::PLAYER2) || @board.empty_cells.empty?
      end
    
        def evaluate(board)
          puts board.inspect
          if wins(board, Player::PLAYER1)
            1
          elsif wins(board, Player::PLAYER2)
            -1
          else
            0
          end
        end
end
