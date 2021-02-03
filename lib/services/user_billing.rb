class UserBilling
  attr_reader :user, :total_order, :total_payment, :balance  

  def initialize(user)
    @user = user
  end

  def get_user_result
    calculate_total_order()
    calculate_total_payment()
    calculate_balance()

    generate_user_result()
  end

  private

  def calculate_total_order()
    total = 0

    if !@user.order_list.nil?
      @user.order_list.each {|order| total += order.product.price.prices[order.size]}
    end

    @total_order = total.round(2)
  end

  def calculate_total_payment
    total = 0

    if !@user.payment_list.nil?
      @user.payment_list.each {|order| total += order.amount}
    end

    @total_payment = total.round(2)
  end    

  def calculate_balance
    @balance = @total_order - @total_payment
  end

  def generate_user_result
    result_hash = {}
        
    result_hash['user'] = @user.name
    result_hash['order_total'] = @total_order
    result_hash['payment_total'] = @total_payment
    result_hash['balance'] = @balance

    result_hash
  end
end