require 'builder/order_builder'

describe 'order builder' do
  it 'should return a order list object' do
    orders_json = [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" }
    ]

    drink_1 = Drink.new('long black', { "small"=> 3.25, "medium"=> 3.50})
    drink_2 = Drink.new('flat white', { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 })

    order_builder = OrderBuilder.new 
    orders = order_builder.get_orders_list(orders_json.to_json, [drink_1, drink_2])

    expect(orders[0].user_name).to eq 'coach'
    expect(orders[0].product.name).to eq 'long black'
    expect(orders[1].user_name).to eq 'ellis'
    expect(orders[1].product.name).to eq 'long black'
    expect(orders[2].user_name).to eq 'rochelle'
    expect(orders[2].product.name).to eq 'flat white'
  end
end