class User
  attr_reader :name, :order_list, :payment_list

  def initialize(name)
    @name = name
  end

  def set_user_order_list(user, orders_list)
    user_order_list = []

    orders_list.each do |order| 
      if user.name == order.user_name
        user_order_list.push(order)
      end
    end
    
    @order_list = user_order_list
  end

  def set_user_payment_list(user, payment_list)
    user_payment_list = []

    payment_list.each do |payment| 
      if user.name == payment.user_name
        user_payment_list.push(payment)
      end
    end

    @payment_list = user_payment_list
  end
end