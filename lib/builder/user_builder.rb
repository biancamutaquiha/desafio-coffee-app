require 'models/user'

class UserBuilder
  def get_users(orders_json)
    users = []
    JSON.parse(orders_json).each  do |order|
      users.push(order['user']) if !users.include?(order['user'])
    end

    user_list = []
    users.each  do |user| 
      user_list.push(User.new(user)) if !user.nil?     
    end

    user_list
  end
end