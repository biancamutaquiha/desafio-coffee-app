require 'models/order'
class OrderSerialize   
  def get_orders_list(orders_json, drink_list)
    order_list = []
    JSON.parse(orders_json).each do |order| 
      drink_list.each do |drink|
        if (order['drink']) == drink.name
            order_list.push(Order.new(order['user'], drink, order['size']))
        end 
      end
    end
    order_list
  end
end
