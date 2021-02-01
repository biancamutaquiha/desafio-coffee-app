require 'serialize/user_serialize'

describe 'user deserialize' do
  it '' do
    order_json = [
      { "user": "coach", "drink": "long black", "size": "medium" },
      { "user": "ellis", "drink": "long black", "size": "small" },
      { "user": "coach", "drink": "flat white", "size": "large" },
      { "user": "zoey", "drink": "long black", "size": "medium" },
      { "user": "zoey", "drink": "short espresso", "size": "small" }
    ]

    user_serialize = UserSerialize.new
    users = user_serialize.get_users(order_json.to_json)

    expect(users.size).to eq 3
    expect(users[0].name).to eq 'coach'
    expect(users[1].name).to eq 'ellis'
    expect(users[2].name).to eq 'zoey'
  end
end