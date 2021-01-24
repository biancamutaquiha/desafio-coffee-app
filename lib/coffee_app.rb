require 'json'
require 'order_service'
require 'price_service'
require 'payment_service'

class CoffeeApp
    def self.call(prices_json, orders_json, payments_json)
      order_list = OrderService.new
      order_user_list = order_list.get_user_orders(orders_json)

      users = order_list.get_total_orders(order_user_list, prices_json)

      payment_list = PaymentService.new
      payments = payment_list.calculate_user_payment(users, payments_json)

      result = payment_list.calculate_user_balance(users, payments)

      return result.to_json
    end
    
end
