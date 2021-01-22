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
        user_name_list.each {|user_name|
            user_order = JSON.parse(orders).select {|order| order['user'] == user_name}
            user_order_list.push(user_order)
        }

        return user_order_list
    end

end
