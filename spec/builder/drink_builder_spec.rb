require 'builder/drink_builder'
require 'json'

describe 'drikn builder' do
  it 'should return a list price' do
    prices_json = [
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "short espresso", "prices": { "small": 3.03 } }
    ]

    drink_builder = DrinkBuilder.new
    drinks = drink_builder.get_drink_list(prices_json.to_json)
    expect(drinks.size).to eq 3
    expect(drinks[0].name).to eq ('long black')
    expect(drinks[1].name).to eq ('flat white')
    expect(drinks[2].name).to eq ('short espresso')
  end

  it 'should to ignore wrong hash' do
    prices_json = [
        { "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "flat white" },
        { "drink_name": "short espresso", "prices": { "small": 3.03 } }
    ]

    drink_builder = DrinkBuilder.new
    drinks = drink_builder.get_drink_list(prices_json.to_json)
    expect(drinks.size).to eq 1
    expect(drinks[0].name).to eq ('short espresso')
  end

  it 'should return empty list when drink list is empty' do
    prices_json = []

    drink_builder = DrinkBuilder.new
    drinks = drink_builder.get_drink_list(prices_json.to_json)
    expect(drinks.size).to eq 0
  end
end
