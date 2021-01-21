require 'payment_service'

describe 'loading lists' do
    it 'should return payments.json from data' do
       payments = [{"user":"coach","amount":27},{"user":"rochelle","amount":22},{"user":"bill","amount":41},{"user":"zoey","amount":0},{"user":"bill","amount":36},{"user":"nick","amount":48},{"user":"coach","amount":42},{"user":"rochelle","amount":36},{"user":"nick","amount":48},{"user":"francis","amount":45},{"user":"rochelle","amount":27},{"user":"francis","amount":31},{"user":"zoey","amount":9},{"user":"nick","amount":47},{"user":"louis","amount":12},{"user":"rochelle","amount":10},{"user":"zoey","amount":43},{"user":"francis","amount":36},{"user":"zoey","amount":49},{"user":"ellis","amount":24}]  
        payment_service = PaymentService.new

      expect(payment_service.get_payments_list).to eq payments.to_json
    end
  end