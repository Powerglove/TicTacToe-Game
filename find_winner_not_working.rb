def find_winner
     Winning_Combinations.each do |array|
      # Fill in the condition, that field is not empty
       if  stone_at(array[0..2]) != ' ' && stone_at(array[0]) ==  stone_at(array[1]) &&  stone_at(array[1]) ==  stone_at(array[2])  
         puts "Winner! The winner is #{stone_at(array[0])}"
          true
       else
          false
        end
     end
  end