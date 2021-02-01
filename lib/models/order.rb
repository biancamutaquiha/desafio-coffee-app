require_relative 'user'
require_relative 'drink'

class Order
  attr_reader :user_name, :product, :size

  def initialize(user_name, product, size)
    @user_name = user_name
    @product = product
    @size = size
  end
end