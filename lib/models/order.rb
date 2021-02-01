require_relative 'user'
require_relative 'drink'

class Order
    attr_reader :user_name, :drink, :size

    def initialize(user_name, drink, size)
        @user_name = user_name
        @drink = drink
        @size = size
    end
end