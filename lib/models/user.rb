class User
  attr_reader :name, :order_list, :payment_list

  def initialize(name, order_list = [], payment_list = [])
    @name = name
    @order_list = order_list
    @payment_list = payment_list
  end

  def set_user_order_list(orders_list)
    orders_list.each do |order| 
      @order_list.push(order) if @name == order.user_name
    end
  end

  def set_user_payment_list(payment_list)
    payment_list.each do |payment| 
      @payment_list.push(payment) if @name == payment.user_name
    end
  end
end