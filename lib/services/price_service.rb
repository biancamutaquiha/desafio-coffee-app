require 'list_helper'
require 'models/price'

class PriceService
    def get_prices_json
       ListHelper.load('prices')
    end

    def get_prices_list(prices_json)
        drink_list = []
        JSON.parse(prices_json).each do |price|
            drink_list.push(Drink.new(price))
        end
        drink_list
    end

end