require 'models/user_billing'

describe 'user billing' do
  before(:each) do
    @order_1 = Order.new('coach', Drink.new('long black', { "small"=> 3.25, "medium"=> 3.50}), 'medium')
    @order_2 = Order.new('coach', Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }), 'large')

    @payment_1 = Payment.new("coach", 2.50)

    @user = User.new('coach')

    @user_billing = UserBilling.new(@user)
  end
  
  it 'given a user should return one hash with calculated values' do
    @user.set_user_payment_list([@payment_1])
    @user.set_user_order_list([@order_1, @order_2])

    expect(@user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 8.00, "payment_total"=> 2.50, "balance"=> 5.50 })
  end

  it 'given a user without order list should return one hash with calculated values' do
    @user.set_user_payment_list([@payment_1])

    expect(@user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 0.00, "payment_total"=> 2.50, "balance"=> -2.50 })
  end

  it 'given a user without payment list should return one hash with calculated values' do
    @user.set_user_order_list([@order_1, @order_2])

    expect(@user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 8.00, "payment_total"=> 0.00, "balance"=> 8.00 })
  end

  it 'given a user without order list and payment list should return one hash with calculated values' do

    expect(@user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 0.00, "payment_total"=> 0.00, "balance"=> 0.00 })
  end 
end