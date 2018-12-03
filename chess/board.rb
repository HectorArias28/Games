require_relative "piece"
class Board

    
    

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        populate
    end

    def [](pos)
        row,col = pos
        self.grid[row][col]
    end

    def []= (pos,piece)
        row,col = pos
        @grid[row][col] = piece
        
    end



    # private     
    
    def populate
        @grid.each_index do |row|
            (0..7).each do |col|
                self[ [row,col] ] = Piece.new unless (2..5).cover?(row)
            end
        end
    end

  

end