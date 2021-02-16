require_relative "billing"
require_relative "grocery"
class GroceryStore 
  def initialize 
    @grocery_orders = []
  end

  def take_order 
    puts "Please enter all the items purchased separated by a comma"
    user_input = gets.chomp!

    if (user_input.length > 0)
      grocery_items_array =  user_input.downcase.split(",").map { |item| item.gsub(/\s+/, "") } 
      add_to_grocery_cart(grocery_items_array)
    else
      puts "No input provided." 
      take_order
    end
  end

  def add_to_grocery_cart(ordered_items) 
    @grocery_orders = ordered_items.select { |item|  !Grocery::PRODUCTS[item.to_sym].nil? }
    print_bill
  end

  def print_bill 
    if (@grocery_orders.length > 0)
      Billing.new(@grocery_orders).receipt
    else
      puts "No order has been placed."
    end
  end

end