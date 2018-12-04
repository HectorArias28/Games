require "byebug"
require 'colorize'
require 'terminal-table'
require_relative 'cursor.rb'


class Display
    attr_reader :cursor 

    def initialize(board)
       @board = board
       @cursor = Cursor.new([0,0], board)
    end

    def tabler
        result = Array.new(8) {Array.new(8)}
        @board.grid.each_index do |row|
            (0..7).each do |col|
                unless @board[[row,col]].nil?
                    result[row][col] = " #{@board[[row,col]].symbol} "
                else 
                    result[row][col] = "   "
                end
            end
        end
        
        color_grid(result)
    end

    def color_grid(matrix)
        matrix.each_index do |row|
            (0..7).each do |col|
                matrix[row][col] = matrix[row][col].yellow
                if row == @cursor.cursor_pos.first && col == @cursor.cursor_pos.last
                    matrix[row][col] = matrix[row][col].white.on_blue 
                elsif row.even? && col.even?
                    matrix[row][col] = matrix[row][col].on_red
                elsif row.odd? && col.odd?
                    matrix[row][col] = matrix[row][col].on_red
                elsif
                    matrix[row][col] = matrix[row][col].on_black      
                end
                
            end
        end
    end

    def render
        system("clear")
        table = tabler
        table = Terminal::Table.new :rows => table
        table.style = {padding_left:0, padding_right:0, width:24, border_x:"", border_i:"", border_y:"" }
        puts table
    end

    # def my_render
    #     system("clear")
    #     puts nil
    #     puts "  0  1  2  3  4  5  6  7"
    #     @board.grid.each_with_index do |subarr,idx| 
    #         print "#{idx} "
    #         subarr.each do |el|
    #             if el.nil? 
    #                 print "  "
    #                 print "  "
    #             else
    #                 print el.symbol
    #                 print "  "
    #             end
    #         end
    #         puts
    #     end
    #     puts nil
    # end

    def test
        while true
            render
            @cursor.get_input
        end
    end
end