require 'models/drink'

class DrinkBuilder
  def build_drink_list(prices_json)
    drink_list = []

    JSON.parse(prices_json).each do |price|
      if is_complete_price_hash?(price)
        drink_list.push(Drink.new(price['drink_name'], price['prices']))
      end 
    end

    drink_list
  end

  private

  def is_complete_price_hash?(price)
    !price['drink_name'].nil? and !price['prices'].nil?
  end
end