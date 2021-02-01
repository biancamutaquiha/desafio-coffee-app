require 'models/price'
require 'models/product'
class Drink < Product
  attr_reader :name, :price

  def initialize(price_list)
    @name = price_list['drink_name']
    @price = Price.new(price_list['prices'])
  end
end