require 'models/user'

class UserService
    def get_users(orders_json)
        users = JSON.parse(orders_json).map {|order| order['user']}.uniq
        users.map {|user| User.new(user)}
    end
end