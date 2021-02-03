class User
  attr_reader :name, :order_list, :payment_list

  def initialize(name, order_list = [], payment_list = [])
    @name = name
  end

  def set_user_order_list(orders_list)
    user_order_list = []

    orders_list.each do |order| 
      user_order_list.push(order) if @name == order.user_name
    end
    
    @order_list = user_order_list
  end

  def set_user_payment_list(payment_list)
    user_payment_list = []

    payment_list.each do |payment| 
      user_payment_list.push(payment) if @name == payment.user_name
    end

    @payment_list = user_payment_list
  end
end