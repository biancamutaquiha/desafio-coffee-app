require 'models/payment'
class PaymentBuilder 
  def get_payments_list(payments_json)
    payments_list = []

    JSON.parse(payments_json).each do |payment|
      if is_complete_payment?(payment)
        payments_list.push(Payment.new(payment['user'], payment['amount']))
      end
    end
        
    payments_list
  end

  def is_complete_payment?(payment)
    !payment['user'].nil? and !payment['amount'].nil?
  end
end