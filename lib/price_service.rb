require 'load_list_helper'

class PriceService
    def get_prices_list
       LoadList.load('prices')
    end

end