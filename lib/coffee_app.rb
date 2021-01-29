require 'jsonable'
require 'services/order_service'
require 'services/price_service'
require 'services/payment_service'
require 'models/user'
require 'models/order'
require 'models/drink'
require 'models/price'
require 'models/payment'
require 'services/user_service'

class CoffeeApp
    def self.call(prices_json, orders_json, payments_json)
      user_service = UserService.new
      users_list = user_service.get_users(orders_json)

      price_service = PriceService.new
      drinks = price_service.get_prices_list(prices_json)

      order_service = OrderService.new
      orders = order_service.get_orders_list(orders_json, drinks)
      

      payment_service = PaymentService.new
      payments = payment_service.get_payments_list(payments_json)
      
       
      order_list = OrderService.new
      total_orders_list = order_list.get_total_orders(orders)

      payment_list = PaymentService.new
      total_payments = payment_list.calculate_user_payment(payments)

      users_list.each {|user| 
        user.set_total_order(total_orders_list)
        user.set_total_payment(total_payments)

       puts user.name
        puts user.total_payment
       puts user.total_order 
      }

      

#####################################################################
      balance = payment_list.calculate_user_balance(total_orders, total_payments)

      result = ListHelper.merge_lists(total_orders, total_payments, balance)

      return result
    end  
end
