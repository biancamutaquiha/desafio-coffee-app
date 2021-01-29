require 'list_helper'

#Interface PaymentService sendo implementada aqui
#Classe anêmica Refletindo Payment

class PaymentService
    def get_payments_json
       ListHelper.load('payments') #Chamadas para a fonte de dados sendo responsabilidade de repository
    end

    def get_payments_list(payments_json)
        payments_list = []
        JSON.parse(payments_json).each do |payment|
            payments_list.push(Payment.new(payment['user'], payment['amount']))
          end
        
        return payments_list
      
    end

    def calculate_user_payment(orders_list, payment_list)
        payment_user_list = get_user_payment(orders_list, payment_list)

        payment_total_list = []
        payment_total_hash = {}
        
        payment_user_list.each do |payment_user|
            payment_total = 0
            payment_user.each {|payment| 
                payment_total_hash['user'] = payment['user']
                payment_total += payment['amount']
                
            }
            payment_total_hash['payment_total'] = payment_total
            payment_total_list.push(JSON.parse(payment_total_hash.to_json))
        end
        
        return payment_total_list.to_json
    end

    def calculate_user_balance(order_total, payment_total)
        balance_list = []
        balance_hash = {}
        JSON.parse(order_total).each do |order| 
            JSON.parse(payment_total).each do |payment| 
                if order['user'] == payment['user']
                    balance_hash['user'] = order['user']
                    balance_hash['balance'] = order['order_total'] - payment['payment_total']
                    balance_list.push(JSON.parse(balance_hash.to_json))
                end 
            end
        end
        
        return balance_list.to_json  
    end

    private
    def get_user_payment(orders_list, payment_list)
        user_list = JSON.parse(orders_list).map { |order| order['user']}.uniq

        payment_user_list = []
        user_list.each do |user|    
            payment_user = JSON.parse(payment_list).select {|payment| payment['user'] == user}
            if payment_user.empty?
                payment_user[0] = {'user' => user, 'amount' => 0.0}
            end
            payment_user_list.push(payment_user)
        end

        return payment_user_list
    end
end