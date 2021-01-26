require 'list_helper'

describe 'loading lists' do
  it 'should return price_json from data' do
    price = [{"drink_name":"short espresso","prices":{"small":3.0}},{"drink_name":"latte","prices":{"small":3.5,"medium":4.0,"large":4.5}},{"drink_name":"flat white","prices":{"small":3.5,"medium":4.0,"large":4.5}},{"drink_name":"long black","prices":{"small":3.25,"medium":3.5}},{"drink_name":"mocha","prices":{"small":4.0,"medium":4.5,"large":5.0}},{"drink_name":"supermochacrapucaramelcream","prices":{"large":5.0,"huge":5.5,"mega":6.0,"ultra":7.0}}]

    expect(ListHelper.load('prices')).to eq price.to_json
  end

  it 'should return a list result' do
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
      { "user": "coach", "balance": 5.50 },
      { "user": "ellis", "balance": 0.00 },
      { "user": "rochelle", "balance": 0.00 },
      { "user": "zoey", "balance": 6.53 }
    ]

    result = [
      { "user": "coach",    "order_total": 8.00, "payment_total": 2.50, "balance": 5.50 },
      { "user": "ellis",    "order_total": 3.25, "payment_total": 3.25, "balance": 0.00 },
      { "user": "rochelle", "order_total": 4.50, "payment_total": 4.50, "balance": 0.00 },
      { "user": "zoey",     "order_total": 6.53, "payment_total": 0.00, "balance": 6.53 }
    ]

    expect(ListHelper.merge_lists(total_order.to_json, payments.to_json, balance.to_json)).to eq result.to_json
  end
end

