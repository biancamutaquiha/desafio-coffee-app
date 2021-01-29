require 'list_helper'
require 'models/order'
require 'json'

class OrderService
    
    def get_orders_list(orders_json, drink_list)
        order_list = []
        JSON.parse(orders_json).each do |order| 
            drink_list.each do |drink|
              if (order['drink']) == drink.name
                order_list.push(Order.new(order['user'], drink, order['size']))
              end 
            end
        end
        return order_list
    end
    
    def get_total_orders(order_list)
        total_order_hash = {}
    
        order_list.each do |user_order|
            if total_order_hash.include?(user_order.user_name)
                total_order_hash[user_order.user_name] += user_order.drink.price.prices[user_order.size]
            else
                total_order_hash[user_order.user_name] = user_order.drink.price.prices[user_order.size] 
            end
        end
        return total_order_hash
    end

end
