require 'models/order'
class OrderBuilder  
  def get_orders_list(orders_json, product_list)
    order_list = []

    JSON.parse(orders_json).each do |order| 
      product_list.each do |product|
        if (order[product.class.to_s.downcase]) == product.name
            order_list.push(Order.new(order['user'], product, order['size']))
        end 
      end
    end
    
    order_list
  end
end
