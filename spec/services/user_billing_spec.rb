require 'services/user_billing'

describe 'user billing' do
  it 'given a user should return one hash with calculated values' do
    order_1 = Order.new('coach', Drink.new({ "drink_name"=> "long black", "prices"=> { "small"=> 3.25, "medium"=> 3.50 }}), 'medium')
    order_2 = Order.new('coach', Drink.new({ "drink_name"=> "flat white", "prices"=> { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }}), 'large')

    payment_1 = Payment.new("coach", 2.50)

    user = User.new('coach')
    user.set_user_payment_list([payment_1])
    user.set_user_order_list([order_1, order_2])
    user_billing = UserBilling.new(user)

    expect(user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 8.00, "payment_total"=> 2.50, "balance"=> 5.50 })
  end

  it 'given a user without order list should return one hash with calculated values' do
    
    payment_1 = Payment.new("coach", 2.50)

    user = User.new('coach')
    user.set_user_payment_list([payment_1])
    user_billing = UserBilling.new(user)

    expect(user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 0.00, "payment_total"=> 2.50, "balance"=> -2.50 })
  end

  it 'given a user without payment list should return one hash with calculated values' do
    order_1 = Order.new('coach', Drink.new({ "drink_name"=> "long black", "prices"=> { "small"=> 3.25, "medium"=> 3.50 }}), 'medium')
    order_2 = Order.new('coach', Drink.new({ "drink_name"=> "flat white", "prices"=> { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }}), 'large')

    user = User.new('coach')
    user.set_user_order_list([order_1, order_2])
    user_billing = UserBilling.new(user)

    expect(user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 8.00, "payment_total"=> 0.00, "balance"=> 8.00 })
  end

  it 'given a user without order list and payment list should return one hash with calculated values' do

    user = User.new('coach')
    user_billing = UserBilling.new(user)

    expect(user_billing.get_user_result).to eq ({ "user"=> "coach", "order_total"=> 0.00, "payment_total"=> 0.00, "balance"=> 0.00 })
  end 
end