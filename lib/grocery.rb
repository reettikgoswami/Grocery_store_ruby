require_relative "grocery_item"

module Grocery

  PRODUCTS = {
    milk: GroceryItem.new("milk", 3.97, 5, 2),
    bread: GroceryItem.new("bread", 2.17, 6, 3),
    banana: GroceryItem.new("banana", 0.99, 0, 0),
    apple: GroceryItem.new("apple", 0.89, 0, 0),
  }

end