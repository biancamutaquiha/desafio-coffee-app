require 'builder/payment_builder'
require 'json'

describe 'payment builder' do
  it 'should return a payment list' do
    payment_json = [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
    ]

    payment_builder = PaymentBuilder.new
    payment_list = payment_builder.build_payment_list(payment_json.to_json)

    expect(payment_list.size).to eq 4
    expect(payment_list[0].user_name).to eq 'coach'
    expect(payment_list[1].user_name).to eq 'ellis'
    expect(payment_list[2].user_name).to eq 'rochelle'
    expect(payment_list[3].user_name).to eq 'ellis'
  end

  it 'should to ignore wrong hash' do
    payment_json = [
        { "amount": 2.50 },
        { "user": "ellis"},
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
    ]

    payment_builder = PaymentBuilder.new
    payment_list = payment_builder.build_payment_list(payment_json.to_json)

    expect(payment_list.size).to eq 2
    expect(payment_list[0].user_name).to eq 'rochelle'
    expect(payment_list[1].user_name).to eq 'ellis'
  end

  it 'should a empty list when payment_json is empty' do
    payment_json = []

    payment_builder = PaymentBuilder.new
    payment_list = payment_builder.build_payment_list(payment_json.to_json)

    expect(payment_list.size).to eq 0
  end
end