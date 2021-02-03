require 'builder/drink_builder'

describe 'drikn builder' do
  it 'should return deserialized price object' do
    prices_json = [
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "short espresso", "prices": { "small": 3.03 } }
    ]

      drink_builder = DrinkBuilder.new
      drinks = drink_builder.get_drink_list(prices_json.to_json)
      expect(drinks[0].name).to eq ('long black')
      expect(drinks[1].name).to eq ('flat white')
      expect(drinks[2].name).to eq ('short espresso')
  end
end
