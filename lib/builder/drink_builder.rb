require 'models/drink'

class DrinkBuilder
  def get_drink_list(prices_json)
    drink_list = []

    JSON.parse(prices_json).each do |price|
      if !price['drink_name'].nil? and !price['prices'].nil?
        drink_list.push(Drink.new(price['drink_name'], price['prices']))
      end 
    end

    drink_list
  end
end