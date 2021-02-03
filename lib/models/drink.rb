require 'models/product'
class Drink < Product
  attr_reader :name, :price_list

  def initialize(name, price_list)
    @name = name
    @price_list = price_list
  end
end