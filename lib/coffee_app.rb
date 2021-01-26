require 'json'
require 'order_service'
require 'price_service'
require 'payment_service'

class CoffeeApp
    def self.call(prices_json, orders_json, payments_json)
      order_list = OrderService.new
      total_orders = order_list.get_total_orders(orders_json, prices_json)

      payment_list = PaymentService.new
      total_payments = payment_list.calculate_user_payment(total_orders, payments_json)

      balance = payment_list.calculate_user_balance(total_orders, total_payments)

      result = ListHelper.merge_lists(total_orders, total_payments, balance)

      return result
    end  
end
