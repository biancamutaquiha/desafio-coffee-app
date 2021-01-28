require_relative 'user'
require_relative 'drink'

class Order
    attr_accessor :user, :drink

    def initialize(user, drink)
        @user = User.new(user)
        @drink = drink
    end
end