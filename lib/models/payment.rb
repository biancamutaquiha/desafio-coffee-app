class Payment
    attr_accessor :user, :amount

    def initialize(user, amount)
        @user = user
        @amount = amount
    end
end