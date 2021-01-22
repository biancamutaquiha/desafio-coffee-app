require 'list_helper'

describe 'loading lists' do
  it 'should return price_json from data' do
    price = [{"drink_name":"short espresso","prices":{"small":3.0}},{"drink_name":"latte","prices":{"small":3.5,"medium":4.0,"large":4.5}},{"drink_name":"flat white","prices":{"small":3.5,"medium":4.0,"large":4.5}},{"drink_name":"long black","prices":{"small":3.25,"medium":3.5}},{"drink_name":"mocha","prices":{"small":4.0,"medium":4.5,"large":5.0}},{"drink_name":"supermochacrapucaramelcream","prices":{"large":5.0,"huge":5.5,"mega":6.0,"ultra":7.0}}]

    expect(ListHelper.load('prices')).to eq price.to_json
  end

  describe 'list helper' do
    it 'should return a list of users orders' do
      orders = [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
      users = ["coach", "ellis", "rochelle", "zoey"]

      expect(ListHelper.get_users_total_orders(orders.to_json)).to eq users
    end
  end
end

