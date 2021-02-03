require 'builder/order_builder'
require 'builder/drink_builder'
require 'builder/payment_builder'
require 'builder/user_builder'
require 'services/user_billing'

class CoffeeApp
  def self.call(prices_json, orders_json, payments_json)
    drink_list =  build_drink_list(prices_json)
    order_list = build_order_list(orders_json, drink_list)
    user_list = build_user_list(orders_json)
    
    payment_list = build_payment_list(payments_json)
    
    user_list.each {|user|
      user.set_user_order_list(order_list)
      user.set_user_payment_list(payment_list)
    }

    result = []
    user_list.each {|user|
      user_billing = UserBilling.new(user)
      result.push(user_billing.get_user_result())
    }         

    result.to_json
  end

  private

  def self.build_drink_list(prices_json)
    drink_builder = DrinkBuilder.new
    drink_builder.get_drink_list(prices_json)
  end

  def self.build_order_list(orders_json, drink_list)
    order_builder = OrderBuilder.new
    order_builder.get_orders_list(orders_json, drink_list)
  end

  def self.build_user_list(orders_json)
    user_builder = UserBuilder.new
    user_builder.get_users(orders_json)
  end

  def self.build_payment_list(payments_json)
    payment_builder = PaymentBuilder.new
    payment_builder.get_payments_list(payments_json)
  end
end
