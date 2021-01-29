require 'services/order_service'
require 'json'

describe 'order service' do
    before(:each) do
      @order_service = OrderService.new
    end
    
    before(:all) do
      order_1 = Order.new('coach', Drink.new({ "drink_name"=> "long black", "prices"=> { "small"=> 3.25, "medium"=> 3.50 }}), 'medium')
      order_2 = Order.new('ellis', Drink.new({ "drink_name"=> "long black", "prices"=> { "small"=> 3.25, "medium"=> 3.50 }}), 'small')
      order_3 = Order.new('rochelle', Drink.new({ "drink_name"=> "flat white", "prices"=> { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }}), 'large')
      order_4 = Order.new('coach', Drink.new({ "drink_name"=> "flat white", "prices"=> { "small"=> 3.50, "medium"=> 4.00, "large"=> 4.50 }}), 'large')
      order_5 = Order.new('zoey', Drink.new({ "drink_name"=> "long black", "prices"=> { "small"=> 3.25, "medium"=> 3.50 }}), 'medium')
      order_6 = Order.new('zoey', Drink.new({ "drink_name"=> "short espresso", "prices"=> { "small"=> 3.03}}), 'small')

      @order_list = [order_1, order_2, order_3, order_4, order_5, order_6]

      @total_order = { "coach" => 8.00, "ellis" => 3.25, "rochelle"=> 4.50, "zoey" => 6.529999999999999}
      
    end

    it 'should calcute total order by user' do
      expect(@order_service.get_total_orders(@order_list)).to eq @total_order
    end
end