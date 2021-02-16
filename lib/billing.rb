require "terminal-table"

class Billing
  def initialize(orders)
    @orders = orders.tally
    @total_amount = 0
    @saved_amount = 0
    @receipt_table_data = []
  end

  def print_table
    table = Terminal::Table.new :headings => ["Item", "Quantity", "Price"], :rows => @receipt_table_data
    table.style = {
      width: 45,
      border_x: "-",
      border_i: "",
      border_y: "",
      border_top: false,
      border_bottom: false,
      all_separators: false,
    }
    table
  end

  def print_receipt
    str = "\n\nTotal price : $#{@total_amount}", "You saved $#{@saved_amount} today.\n\n"
    puts "\n", print_table, str
  end

  def receipt
    total_amount, saved_amount = @orders.keys.reduce([0, 0]) do |amounts, item_name|
      total_price = 0
      saved_price = 0
      amounts[0] += total_price
      amounts[1] += saved_price

      @receipt_table_data << [item_name.capitalize, @orders[item_name], "$#{total_price.round(2)}"]
      amounts
    end
    @total_amount = total_amount.round(2)
    @saved_amount = saved_amount.round(2)
    print_receipt
  end
end