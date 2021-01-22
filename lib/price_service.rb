require 'list_helper'

class PriceService
    def get_prices_list
       ListHelper.load('prices')
    end

end