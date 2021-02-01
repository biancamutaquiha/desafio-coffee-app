require 'serialize/payment_serialize'

describe 'payment service' do
  it 'should return deserialized payment object' do
    payment_json = [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
    ]

    payment_serialize = PaymentSerialize.new
    payment_list = payment_serialize.get_payments_list(payment_json.to_json)

    expect(payment_list[0].user_name).to eq 'coach'
    expect(payment_list[1].user_name).to eq 'ellis'
    expect(payment_list[2].user_name).to eq 'rochelle'
    expect(payment_list[3].user_name).to eq 'ellis'
  end
end