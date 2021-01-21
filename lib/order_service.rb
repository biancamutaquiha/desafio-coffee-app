require 'load_list_helper'

class OrderService
    def get_orders_list
       LoadList.load('orders')
    end

end
