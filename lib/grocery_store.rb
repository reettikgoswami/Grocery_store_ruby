class GroceryStore 

  def take_order 
    puts "Please enter all the items purchased separated by a comma"
    user_input = gets.chomp!

    if (user_input.length > 0)
      grocery_items_array =  user_input.downcase.split(",").map { |item| item.gsub(/\s+/, "") } 
      puts grocery_items_array
    else
      puts "No input provided." 
      take_order
    end
  end

end