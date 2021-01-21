require 'load_list_helper'

class PaymentService
    def get_payments_list
       LoadList.load('payments')
    end

end