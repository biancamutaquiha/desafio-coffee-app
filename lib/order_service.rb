require 'list_helper'

class OrderService
    def get_orders_list
       ListHelper.load('orders')
    end 

    def get_total_orders(orders_list, price_list)
        user_order_list = get_user_orders(orders_list, price_list)

        total_order_list = []
        total_order_hash = {}
    
        user_order_list.each do |user_order|
            total_order = 0
            
            user_order.each do |user|
                total_order_hash['user'] = user['user']
                total_order += calculate_user_drink_price(user['drink'], user['size'], price_list)
            end

            total_order_hash['order_total'] = total_order.round(2)
            total_order_list.push(JSON.parse(total_order_hash.to_json))
        end
        
        return total_order_list.to_json
    end

    private
    def get_user_orders(orders_list, price_list)
        user_name_list = JSON.parse(orders_list).map { |order| order['user']}.uniq
        
        user_order_list = user_name_list.map do |user_name|
            user_order = JSON.parse(orders_list).select {|order| order['user'] == user_name}
        end

        return user_order_list
    end

    private
    def calculate_user_drink_price(drink, size, prices_list)       
        JSON.parse(prices_list).each do |price|    
            if price['drink_name'] == drink
                return price['prices'][size]
            end
        end
    end

end
