class User
    attr_reader :name, :total_order, :total_payment, :balance

    def initialize(name)
        @name = name
    end

    def set_total_order(total_order_hash)
        @total_order = 0
        if total_order_hash.include?(@name)
            @total_order = total_order_hash[@name]
        end
    end

    def set_total_payment(total_payment_hash)
        @total_payment = 0
        if total_payment_hash.include?(@name)
            @total_payment = total_payment_hash[@name]
        end
    end

    def set_balance
    end
end