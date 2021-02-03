require 'models/user'

describe 'user' do
  it 'should set order list by user' do
    order_1 = Order.new('coach', Drink.new('long black', { "small"=> 3.25, "medium"=> 3.50 }), 'medium')
    order_2 = Order.new('coach', Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }), 'large')

    user = User.new('coach')
    user.set_user_order_list([order_1, order_2])
    expect(user.order_list.size).to eq 2
    expect(user.order_list[0].user_name).to eq 'coach'
  end

  it 'should set empty order list when have not users orders' do
    user = User.new('coach')
    user.set_user_order_list([])
    expect(user.order_list.size).to eq 0
  end

  it 'should set payment list by user' do
    payment_1 = Payment.new("coach", 2.50)
    payment_2 = Payment.new("coach", 2.50)
    payment_3 = Payment.new("coach", 2.50)

    user = User.new('coach')
    user.set_user_payment_list([payment_1, payment_2, payment_3])
    expect(user.payment_list.size).to eq 3
    expect(user.payment_list[0].user_name).to eq 'coach'
  end

  it 'should set empty payment list when have not users payments' do
    user = User.new('coach')
    user.set_user_payment_list([])
    expect(user.payment_list.size).to eq 0
  end
end