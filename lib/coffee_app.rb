require 'serialize/order_serialize'
require 'serialize/price_serialize'
require 'serialize/payment_serialize'
require 'serialize/user_serialize'
require 'services/user_billing'

class CoffeeApp
  def self.call(prices_json, orders_json, payments_json)
    price = PriceSerialize.new
    drinks = price.get_prices_list(prices_json)
    
    user = UserSerialize.new
    users_list = user.get_users(orders_json)

    order = OrderSerialize.new
    orders = order.get_orders_list(orders_json, drinks)
    
    payment = PaymentSerialize.new
    payments = payment.get_payments_list(payments_json)
    
    users_list.each {|user|
      user.set_user_order_list(orders)
      user.set_user_payment_list(payments)
    }

    result = []
    users_list.each {|user|
      user_billing = UserBilling.new(user)
      result.push(user_billing.get_user_result())
    }         

    result.to_json
  end  
end
