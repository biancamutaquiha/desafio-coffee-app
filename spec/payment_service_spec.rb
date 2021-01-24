require 'payment_service'

describe 'loading prices list' do
    it 'should return payments.json from data' do
      payments = [{"user":"coach","amount":27},{"user":"rochelle","amount":22},{"user":"bill","amount":41},{"user":"zoey","amount":0},{"user":"bill","amount":36},{"user":"nick","amount":48},{"user":"coach","amount":42},{"user":"rochelle","amount":36},{"user":"nick","amount":48},{"user":"francis","amount":45},{"user":"rochelle","amount":27},{"user":"francis","amount":31},{"user":"zoey","amount":9},{"user":"nick","amount":47},{"user":"louis","amount":12},{"user":"rochelle","amount":10},{"user":"zoey","amount":43},{"user":"francis","amount":36},{"user":"zoey","amount":49},{"user":"ellis","amount":24}]  
      payment_service = PaymentService.new

      expect(payment_service.get_payments_list).to eq payments.to_json
    end
end

describe 'payment service' do
  it 'should return the total payments by user' do
      orders = [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
      
      payment_list = [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
      ]
    
      
      payments = [
        { "user": "coach", "payment_total": 2.50 },
        { "user": "ellis", "payment_total": 3.25 },
        { "user": "rochelle", "payment_total": 4.50 },
        { "user": "zoey", "payment_total": 0.00 }
      ]
      
      payment_service = PaymentService.new
      expect(payment_service.calculate_user_payment(orders.to_json, payment_list.to_json)).to eq payments.to_json
  end

    it 'should calculate what each user now owes' do
      payments = [
        { "user": "coach", "payment_total": 2.50 },
        { "user": "ellis", "payment_total": 3.25 },
        { "user": "rochelle", "payment_total": 4.50 },
        { "user": "zoey", "payment_total": 0.00 }
      ]

      total_order = [
        { "user": "coach",    "order_total": 8.00 },
        { "user": "ellis",    "order_total": 3.25 },
        { "user": "rochelle", "order_total": 4.50 },
        { "user": "zoey",     "order_total": 6.53 }
      ]

      balance = [
        { "user": "coach",    "order_total": 8.00, "payment_total": 2.50, "balance": 5.50 },
        { "user": "ellis",    "order_total": 3.25, "payment_total": 3.25, "balance": 0.00 },
        { "user": "rochelle", "order_total": 4.50, "payment_total": 4.50, "balance": 0.00 },
        { "user": "zoey",     "order_total": 6.53, "payment_total": 0.00, "balance": 6.53 }
      ]
      
      payment_service = PaymentService.new

      expect(payment_service.calculate_user_balance(total_order.to_json, payments.to_json)).to eq JSON.parse(balance.to_json)
    end 
end