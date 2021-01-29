require 'list_helper'
class PaymentService
    
    def get_payments_list(payments_json)
        payments_list = []
        JSON.parse(payments_json).each do |payment|
            payments_list.push(Payment.new(payment['user'], payment['amount']))
          end
        
        return payments_list
      
    end

    def calculate_user_payment(payment_list)
        total_payment_hash = {}
    
        payment_list.each do |payment|
            if total_payment_hash.include?(payment.user_name)
                total_payment_hash[payment.user_name] += payment.amount
            else
                total_payment_hash[payment.user_name] = payment.amount 
            end
        end
        return total_payment_hash
    end
end