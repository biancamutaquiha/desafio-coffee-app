require 'builder/user_builder'
require 'json'

describe 'user builder' do
  it 'should return a user list' do
    order_json = [
      { "user": "coach", "drink": "long black", "size": "medium" },
      { "user": "ellis", "drink": "long black", "size": "small" },
      { "user": "coach", "drink": "flat white", "size": "large" },
      { "user": "zoey", "drink": "long black", "size": "medium" },
      { "user": "zoey", "drink": "short espresso", "size": "small" }
    ]

    user_builder = UserBuilder.new
    users = user_builder.get_users(order_json.to_json)

    expect(users.size).to eq 3
    expect(users[0].name).to eq 'coach'
    expect(users[1].name).to eq 'ellis'
    expect(users[2].name).to eq 'zoey'
  end

  it 'should ignore wrong hash' do
    order_json = [
      { "user": "coach", "drink": "long black", "size": "medium" },
      { "drink": "long black", "size": "small" },
      { "user": "coach", "drink": "flat white", "size": "large" },
      { "user": "zoey", "drink": "long black", "size": "medium" },
      { "user": "zoey", "drink": "short espresso", "size": "small" }
    ]

    user_builder = UserBuilder.new
    users = user_builder.get_users(order_json.to_json)

    expect(users.size).to eq 2
    expect(users[0].name).to eq 'coach'
    expect(users[1].name).to eq 'zoey'
  end

  it 'should return empty lits when order_json is empty' do
    order_json = []

    user_builder = UserBuilder.new
    users = user_builder.get_users(order_json.to_json)

    expect(users.size).to eq 0
  end
end