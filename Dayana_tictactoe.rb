class Board  

attr_accessor :fields

Winning_Combinations = [
      ['1','2','3'],
      ['4','5','6'],
      ['7','8','9'],
      ['1','4','7'],
      ['2','5','8'],
      ['3','6','9'],
      ['1','5','9'],
      ['3','5','7']
    ]

  def initialize
    @fields =  {
       '1' => ' ', '2' => ' ', '3' => ' ',
       '4' => ' ', '5' => ' ', '6' => ' ',
       '7' => ' ', '8' => ' ', '9' => ' '
     }   
  end   


  def set_stone_at(position, stone)
    @fields[position] = stone
  end   

  def stone_at(position)
    stone = @fields[position]
  end   

  def show
   puts @fields
  end

  def valid_position?(position)
    if (1..9).member?(position.to_i) == true
      return true
    else
      return false
    end
  end

  def valid_move(position)
    if stone_at(position) == 'X' || stone_at(position) == 'O'
      false
    else
      true
    end
  end

  def find_winner
     Winning_Combinations.each do |array|
      # Fill in the condition, that field is not empty
      if stone_at(array[0]) == 'X' || stone_at(array[0]) == 'O'
        if   stone_at(array[0]) ==  stone_at(array[1]) &&  stone_at(array[1]) ==  stone_at(array[2])  
         puts "Winner! The winner is #{stone_at(array[0])}"
          true
        else
          false
        end
      else
        false
      end
    end
  end

end

class Game
  attr_accessor :board, :position
  attr_accessor :fields

  def initialize
    @board = Board.new 
  end  

  def print_board
    puts "\n#{@board.stone_at('1')} | #{@board.stone_at('2')} | #{@board.stone_at('3')}"
    puts "--*---*---"
    puts "#{@board.stone_at('4')} | #{@board.stone_at('5')} | #{@board.stone_at('6')}"
    puts "--*---*---"
    puts "#{@board.stone_at('7')} | #{@board.stone_at('8')} | #{@board.stone_at('9')} \n"
  end

  def ask_user_for_move
    puts "Select your move. Please enter a position from 1 to 9."
    @position = gets.chomp.to_s
  end

  # def next_stone
    
  #   while @count_move < 10
  #     if @count_move.even? == true
  #       puts 'O'
  #     else
  #       puts 'X'
  #     end
  #   end
  # end

  def next_stone

    if @count_move.even? == true
      board.set_stone_at(position, 'X')
    else
      board.set_stone_at(position, 'O')
    end   
  end

  def game_start
    @count_move = 0
    while @count_move < 10
      ask_user_for_move
      #store what the user inputs in a local variable called position
      if board.valid_position?(position) == false
        puts "This is not a valid move"
      else
      next_stone
      print_board
      @count_move = @count_move + 1
      board.find_winner
      end
    end
  end

end


# board = Board.new
# board.show           # => expect { '1' => nil, '2' => nil, '3' => nil, ... }

# board.stone_at('2')  # => expect nil

# board.set_stone_at('2', 'O')
# board.stone_at('2')  # => expect 'O'

# board.set_stone_at('3', 'X')
# board.show 

# game = Game.new
# game.board.set_stone_at('1', 'X')
# game.board.set_stone_at('2', 'X')
# game.board.set_stone_at('3', 'O')
# game.board.set_stone_at('4', 'O')
# game.board.set_stone_at('6', 'X')
# game.board.set_stone_at('7', 'O')
# game.board.set_stone_at('8', 'X')
# game.print_board

# game = Game.new
# game.ask_user_for_move

game = Game.new
game.game_start


