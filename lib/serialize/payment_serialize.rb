require 'models/payment'

class PaymentSerialize
    
    def get_payments_list(payments_json)
        payments_list = []
        JSON.parse(payments_json).each do |payment|
            payments_list.push(Payment.new(payment['user'], payment['amount']))
          end
        
        return payments_list
      
    end
end