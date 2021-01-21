require 'price_service'

describe 'loading lists' do
    it 'should return price_json from data' do
      prices = [{"drink_name":"short espresso","prices":{"small":3.0}},{"drink_name":"latte","prices":{"small":3.5,"medium":4.0,"large":4.5}},{"drink_name":"flat white","prices":{"small":3.5,"medium":4.0,"large":4.5}},{"drink_name":"long black","prices":{"small":3.25,"medium":3.5}},{"drink_name":"mocha","prices":{"small":4.0,"medium":4.5,"large":5.0}},{"drink_name":"supermochacrapucaramelcream","prices":{"large":5.0,"huge":5.5,"mega":6.0,"ultra":7.0}}]
  
      price_service = PriceService.new

      expect(price_service.get_prices_list).to eq price.to_json
    end
  end