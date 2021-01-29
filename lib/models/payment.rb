class Payment
    attr_accessor :user_name, :amount

    def initialize(user_name, amount)
        @user_name = user_name
        @amount = amount
    end
end