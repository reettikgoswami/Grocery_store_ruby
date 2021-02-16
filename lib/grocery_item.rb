class GroceryItem

  def initialize(name, unit_price, discounted_price, discount_quantity)
    @name = name
    @unit_price = unit_price
    @discounted_price = discounted_price
    @discount_quantity = discount_quantity
    @is_discounted_item = discount_quantity >=1
  end

  def actual_price(quantity)
    quantity * @unit_price
  end

  def purchase(quantity)
    if @is_discounted_item
    total_price = ((quantity / @discount_quantity) * @discounted_price) + ((quantity % @discount_quantity) * @unit_price)
    actual_price =  actual_price(quantity)
    saved_amount = actual_price - total_price
    [total_price, saved_amount]
    else
    [actual_price(quantity), 0] 
    end

  end

end