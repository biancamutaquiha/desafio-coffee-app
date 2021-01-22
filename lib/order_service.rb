require 'load_list_helper'

class OrderService
    def get_orders_list
       LoadList.load('orders')
    end

    def get_user_orders(orders)
        user_name_list = []
        for order in JSON.parse(orders) do
            if !user_name_list.include?(order['user'])
              user_name_list.push(order['user'])
            end
        end
        
        user_order_list = []
        user_name_list.each do |user_name|
            user_order = JSON.parse(orders).select {|order| order['user'] == user_name}
            user_order_list.push(user_order)
        end

        return user_order_list
    end

    def get_total_orders(user_order_list, price_list)
        #total_order = 0
        total_order_list = []
        hash_total_order = {}
    
        user_order_list.each do |user_order|
            total_order = 0
            
            user_order.each do |user|        
                hash_total_order['user'] = user['user']
                total_order += calculate_user_drink_price(user['drink'], user['size'], price_list)
            end

            hash_total_order['order_total'] = total_order.round(2)
            total_order_list.push(JSON.parse(hash_total_order.to_json))
        end
        
        total_order_list.to_json
    end

    def calculate_user_drink_price(drink, size, prices_list)       
        JSON.parse(prices_list).each do |price|    
            if price['drink_name'] == drink
                return price['prices'][size]
            end
        end
    end

end
