require 'builder/order_builder'
require 'builder/drink_builder'
require 'builder/payment_builder'
require 'builder/user_builder'
require 'services/user_billing'

class CoffeeApp
  def self.call(prices_json, orders_json, payments_json)
    drink_list =  build_drink_list(prices_json)
    order_list = build_order_list(orders_json, drink_list)
    payment_list = build_payment_list(payments_json)
    
    user_list = build_user_list(order_list, payment_list)

    result = []
    user_list.each {|user|
      user_billing = UserBilling.new(user)
      result.push(user_billing.get_user_result())
    }         

    result.to_json
  end

  private

  def self.build_drink_list(prices_json)
    DrinkBuilder.new.get_drink_list(prices_json)
  end

  def self.build_order_list(orders_json, drink_list)
    OrderBuilder.new.get_orders_list(orders_json, drink_list)
  end

  def self.build_user_list(orders_list, payment_list)
    UserBuilder.new.get_users(orders_list, payment_list)
  end

  def self.build_payment_list(payments_json)
    PaymentBuilder.new.get_payments_list(payments_json)
  end
end
