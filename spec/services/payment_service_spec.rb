require 'services/payment_service'

describe 'payment service' do
  before(:each) do
    @payment_service = PaymentService.new
  end

  before(:all) do
  @orders = [
    { "user": "coach", "drink": "long black", "size": "medium" },
    { "user": "ellis", "drink": "long black", "size": "small" },
    { "user": "rochelle", "drink": "flat white", "size": "large" },
    { "user": "coach", "drink": "flat white", "size": "large" },
    { "user": "zoey", "drink": "long black", "size": "medium" },
    { "user": "zoey", "drink": "short espresso", "size": "small" }
  ]

  @payment_list = [
    { "user": "coach", "amount": 2.50 },
    { "user": "ellis", "amount": 2.60 },
    { "user": "rochelle", "amount": 4.50 },
    { "user": "ellis", "amount": 0.65 }
  ]

  @payments = [
    { "user": "coach", "payment_total": 2.50 },
    { "user": "ellis", "payment_total": 3.25 },
    { "user": "rochelle", "payment_total": 4.50 },
    { "user": "zoey", "payment_total": 0.00 }
  ]

  @total_order = [
    { "user": "coach",    "order_total": 8.00 },
    { "user": "ellis",    "order_total": 3.25 },
    { "user": "rochelle", "order_total": 4.50 },
    { "user": "zoey",     "order_total": 6.53 }
  ]

  @balance = [
    { "user": "coach", "balance": 5.50 },
    { "user": "ellis", "balance": 0.00 },
    { "user": "rochelle", "balance": 0.00 },
    { "user": "zoey", "balance": 6.53 }
  ]
  end

  it 'should return the total payments by user' do 
    expect(@payment_service.calculate_user_payment(@orders.to_json, @payment_list.to_json)).to eq @payments.to_json
  end

  it 'should calculate what each user now owes' do
    expect(@payment_service.calculate_user_balance(@total_order.to_json, @payments.to_json)).to eq @balance.to_json
  end 
end