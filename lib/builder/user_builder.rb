require 'models/user'

class UserBuilder
  def get_users(orders_list, payment_list)
    users = get_all_users(orders_list)
  
    user_list = build_users(users, orders_list, payment_list)

    user_list
  end

  private 

  def get_all_users(orders_list)
    users = []
    orders_list.each  do |order|
      users.push(order.user_name) if !users.include?(order.user_name)
    end
    users
  end

  def build_users(users, orders_list, payment_list)
    user_list = []
    users.each  do |user| 
      user_list.push(User.new(user))     
    end
    
    user_list.each do |user| 
      user.set_user_order_list(orders_list)
      user.set_user_payment_list(payment_list)

      user_list
    end
  end
end