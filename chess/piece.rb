class Piece
attr_accessor :pos, :symbol

    def initialize(pos)
        @pos = pos
        @symbol = "X"
    end

    def inspect
        symbol
    end
















    # private
    # def to_s
    #     pos
    # end

    # def pos
    #     to_s 
    # end


end