require 'builder/user_builder'
require 'json'
require 'models/order'

describe 'user builder' do
  it 'should return a user list' do
    order_1 = Order.new('coach', Drink.new('long black', { "small"=> 3.25, "medium"=> 3.50}), 'medium')
    order_2 = Order.new('ellis', Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }), 'large')
    order_3 = Order.new('coach', Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }), 'large')
    order_4 = Order.new('zoey', Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }), 'large')
    order_5 = Order.new('zoey', Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }), 'large')

    payment_1 = Payment.new("coach", 2.50)

    user_builder = UserBuilder.new
    users = user_builder.build_user_list([order_1, order_2, order_3, order_4, order_5], [payment_1])

    expect(users.size).to eq 3
    expect(users[0].name).to eq 'coach'
    expect(users[1].name).to eq 'ellis'
    expect(users[2].name).to eq 'zoey'
  end

  it 'should return empty lits when order_json is empty' do
    order_json = []
    payment_1 = Payment.new("coach", 2.50)

    user_builder = UserBuilder.new
    users = user_builder.build_user_list(order_json, [payment_1])

    expect(users.size).to eq 0
  end
end