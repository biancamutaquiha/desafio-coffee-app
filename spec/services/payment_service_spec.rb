require 'services/payment_service'

describe 'payment service' do
  before(:each) do
    @payment_service = PaymentService.new
  end

  before(:all) do
    payment_1 = Payment.new("coach", 2.50)
    payment_2 = Payment.new("ellis", 3.25)
    payment_3 = Payment.new("rochelle", 4.50)
    payment_4 = Payment.new("ellis", 0.65)

    @payment_list = [payment_1, payment_2, payment_3, payment_4]

  @payments = { "coach"=> 2.50, "ellis"=> 3.90 , "rochelle"=> 4.50 }
  end

  it 'should return the total payments by user' do 
    expect(@payment_service.calculate_user_payment(@payment_list)).to eq @payments
  end
end