require_relative "piece"
class Board
attr_reader :grid

    
    

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        populate
    end

    def inspect
        puts nil
    end

    def [](pos)
        row,col = pos
        self.grid[row][col]
    end

    def []= (pos,piece)
        row,col = pos
        @grid[row][col] = piece
        
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise ArgumentError.new "There must be a piece at start position"
        end
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
        moving_piece = self[end_pos]
        moving_piece.pos=(end_pos)
    end

    def valid_pos?(pos)
       pos.all? {|el| el >= 0 && el <= 7 }
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end



    # private     
    
    def populate
        @grid.each_with_index do |subarr,row|
            subarr.each_with_index do |_,col|
                self[ [row,col] ] = Piece.new([row, col]) unless (2..5).cover?(row)
            end
        end
    end

    # def render

    # end
  

end