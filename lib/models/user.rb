class User
    attr_reader :name, :total_order, :total_payment, :balance

    def initialize(name)
        @name = name
    end

    def set_total_order(total_order_hash)
        @total_order = total_order_hash[@name]
    end

    def set_total_payment
    end

    def set_balance
    end
end