require 'models/price'

class Drink
    attr_accessor :name, :price

    def initialize(price_list)
        @name = price_list['drink_name']
        @price = Price.new(price_list['prices'], price_list['size'])
    end
end