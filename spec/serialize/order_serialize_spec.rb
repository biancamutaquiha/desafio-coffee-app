require 'serialize/order_serialize'

describe 'order deserialize' do
  it 'should return deserialized order object' do
    orders_json = [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" }
    ]

    drink_1 = Drink.new({ "drink_name"=> "long black", "prices"=> { "small"=> 3.25, "medium"=> 3.50 }})
    drink_2 = Drink.new({ "drink_name"=> "flat white", "prices"=> { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }})

    order_serialize = OrderSerialize.new 
    orders = order_serialize.get_orders_list(orders_json.to_json, [drink_1, drink_2])

    expect(orders[0].user_name).to eq 'coach'
    expect(orders[0].product.name).to eq 'long black'
    expect(orders[1].user_name).to eq 'ellis'
    expect(orders[1].product.name).to eq 'long black'
    expect(orders[2].user_name).to eq 'rochelle'
    expect(orders[2].product.name).to eq 'flat white'
  end
end