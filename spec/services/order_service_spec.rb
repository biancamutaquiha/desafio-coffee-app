require 'services/order_service'
require 'json'

describe 'order service' do
    before(:each) do
      @order_service = OrderService.new
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

      @prices = [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]

      @total_order = [
        { "user": "coach",    "order_total": 8.00 },
        { "user": "ellis",    "order_total": 3.25 },
        { "user": "rochelle", "order_total": 4.50 },
        { "user": "zoey",     "order_total": 6.53 }
      ]
    end

    it 'should calcute total order by user' do
      expect(@order_service.get_total_orders(@orders.to_json, @prices.to_json)).to eq @total_order.to_json
    end
end