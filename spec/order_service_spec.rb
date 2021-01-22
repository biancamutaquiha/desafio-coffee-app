require 'order_service'

describe 'loading lists' do
    it 'should return order_json from data' do
      orders = [{"user":"coach","drink":"long black","size":"medium"},{"user":"ellis","drink":"long black","size":"small"},{"user":"rochelle","drink":"flat white","size":"large"},{"user":"coach","drink":"flat white","size":"large"},{"user":"zoey","drink":"long black","size":"medium"},{"user":"zoey","drink":"short espresso","size":"small"},{"user":"nick","drink":"mocha","size":"large"},{"user":"bill","drink":"supermochacrapucaramelcream","size":"ultra"},{"user":"ellis","drink":"mocha","size":"small"},{"user":"rochelle","drink":"short espresso","size":"small"},{"user":"francis","drink":"long black","size":"small"},{"user":"coach","drink":"mocha","size":"medium"},{"user":"coach","drink":"short espresso","size":"small"},{"user":"rochelle","drink":"long black","size":"medium"},{"user":"bill","drink":"mocha","size":"medium"},{"user":"ellis","drink":"mocha","size":"small"},{"user":"louis","drink":"mocha","size":"small"},{"user":"coach","drink":"latte","size":"medium"},{"user":"zoey","drink":"flat white","size":"large"},{"user":"ellis","drink":"latte","size":"small"},{"user":"louis","drink":"latte","size":"medium"},{"user":"zoey","drink":"short espresso","size":"small"},{"user":"louis","drink":"long black","size":"small"},{"user":"zoey","drink":"flat white","size":"large"},{"user":"rochelle","drink":"supermochacrapucaramelcream","size":"large"},{"user":"coach","drink":"flat white","size":"large"},{"user":"francis","drink":"mocha","size":"small"},{"user":"francis","drink":"short espresso","size":"small"},{"user":"francis","drink":"short espresso","size":"small"},{"user":"ellis","drink":"flat white","size":"small"},{"user":"coach","drink":"long black","size":"small"},{"user":"coach","drink":"short espresso","size":"small"},{"user":"ellis","drink":"supermochacrapucaramelcream","size":"huge"},{"user":"ellis","drink":"short espresso","size":"small"},{"user":"coach","drink":"latte","size":"small"},{"user":"nick","drink":"short espresso","size":"small"},{"user":"ellis","drink":"short espresso","size":"small"},{"user":"rochelle","drink":"latte","size":"large"},{"user":"coach","drink":"latte","size":"medium"},{"user":"rochelle","drink":"long black","size":"small"},{"user":"ellis","drink":"flat white","size":"large"},{"user":"bill","drink":"latte","size":"large"},{"user":"rochelle","drink":"supermochacrapucaramelcream","size":"mega"},{"user":"coach","drink":"mocha","size":"large"},{"user":"bill","drink":"supermochacrapucaramelcream","size":"mega"},{"user":"francis","drink":"long black","size":"small"},{"user":"coach","drink":"long black","size":"small"},{"user":"francis","drink":"flat white","size":"small"},{"user":"coach","drink":"long black","size":"medium"},{"user":"bill","drink":"long black","size":"medium"},{"user":"bill","drink":"supermochacrapucaramelcream","size":"huge"},{"user":"ellis","drink":"supermochacrapucaramelcream","size":"ultra"},{"user":"rochelle","drink":"short espresso","size":"small"},{"user":"louis","drink":"mocha","size":"large"},{"user":"coach","drink":"supermochacrapucaramelcream","size":"large"},{"user":"nick","drink":"short espresso","size":"small"},{"user":"bill","drink":"mocha","size":"medium"},{"user":"ellis","drink":"short espresso","size":"small"},{"user":"nick","drink":"flat white","size":"large"},{"user":"zoey","drink":"supermochacrapucaramelcream","size":"ultra"},{"user":"louis","drink":"flat white","size":"large"},{"user":"louis","drink":"long black","size":"small"},{"user":"nick","drink":"short espresso","size":"small"},{"user":"rochelle","drink":"latte","size":"medium"},{"user":"louis","drink":"mocha","size":"small"},{"user":"louis","drink":"long black","size":"medium"},{"user":"coach","drink":"supermochacrapucaramelcream","size":"mega"},{"user":"francis","drink":"long black","size":"medium"},{"user":"louis","drink":"flat white","size":"small"},{"user":"bill","drink":"supermochacrapucaramelcream","size":"mega"},{"user":"zoey","drink":"latte","size":"small"},{"user":"ellis","drink":"flat white","size":"small"},{"user":"zoey","drink":"flat white","size":"small"},{"user":"ellis","drink":"short espresso","size":"small"},{"user":"rochelle","drink":"flat white","size":"medium"},{"user":"ellis","drink":"supermochacrapucaramelcream","size":"large"},{"user":"nick","drink":"latte","size":"small"},{"user":"coach","drink":"latte","size":"medium"},{"user":"nick","drink":"mocha","size":"medium"},{"user":"louis","drink":"latte","size":"large"},{"user":"louis","drink":"supermochacrapucaramelcream","size":"mega"},{"user":"francis","drink":"supermochacrapucaramelcream","size":"mega"},{"user":"zoey","drink":"latte","size":"medium"},{"user":"francis","drink":"latte","size":"medium"},{"user":"coach","drink":"flat white","size":"small"},{"user":"coach","drink":"supermochacrapucaramelcream","size":"large"},{"user":"ellis","drink":"short espresso","size":"small"},{"user":"louis","drink":"flat white","size":"medium"},{"user":"bill","drink":"short espresso","size":"small"},{"user":"nick","drink":"flat white","size":"large"},{"user":"zoey","drink":"mocha","size":"large"},{"user":"rochelle","drink":"long black","size":"medium"},{"user":"zoey","drink":"latte","size":"small"},{"user":"rochelle","drink":"short espresso","size":"small"},{"user":"francis","drink":"mocha","size":"large"},{"user":"bill","drink":"long black","size":"small"},{"user":"francis","drink":"supermochacrapucaramelcream","size":"ultra"},{"user":"rochelle","drink":"supermochacrapucaramelcream","size":"large"},{"user":"ellis","drink":"supermochacrapucaramelcream","size":"ultra"},{"user":"nick","drink":"supermochacrapucaramelcream","size":"huge"}]  
      order_service = OrderService.new

      expect(order_service.get_orders_list).to eq orders.to_json
    end
end

describe 'order service' do
    it 'should return a list of orders by user' do
      orders = [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
    
      user_order = [
        [{"user"=>"coach", "drink"=>"long black", "size"=>"medium"}, {"user"=>"coach", "drink"=>"flat white", "size"=>"large"}], 
        [{"user"=>"ellis", "drink"=>"long black", "size"=>"small"}], 
        [{"user"=>"rochelle", "drink"=>"flat white", "size"=>"large"}], 
        [{"user"=>"zoey", "drink"=>"long black", "size"=>"medium"}, {"user"=>"zoey", "drink"=>"short espresso", "size"=>"small"}]
      ]
      
      order_service = OrderService.new

      expect(order_service.get_user_orders(orders.to_json)).to eq user_order
 
    end

    it 'should calcute total order by user' do
      prices = [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]

      user_order = [
        [{"user"=>"coach", "drink"=>"long black", "size"=>"medium"}, {"user"=>"coach", "drink"=>"flat white", "size"=>"large"}], 
        [{"user"=>"ellis", "drink"=>"long black", "size"=>"small"}], 
        [{"user"=>"rochelle", "drink"=>"flat white", "size"=>"large"}], 
        [{"user"=>"zoey", "drink"=>"long black", "size"=>"medium"}, {"user"=>"zoey", "drink"=>"short espresso", "size"=>"small"}]
      ]

      total_order = [
        { "user": "coach",    "order_total": 8.00 },
        { "user": "ellis",    "order_total": 3.25 },
        { "user": "rochelle", "order_total": 4.50 },
        { "user": "zoey",     "order_total": 6.53 }
      ]

      order_service = OrderService.new
      expect(order_service.get_total_orders(user_order, prices.to_json)).to eq total_order.to_json

    end

    it 'should calculate drinks prices' do
      prices = [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]
      
      order_service = OrderService.new

      expect(order_service.calculate_user_drink_price('latte', 'medium', prices.to_json)).to eq 4.00

    end
end