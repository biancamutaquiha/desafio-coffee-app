class ListHelper
    def self.load(filename)
        JSON.parse(File.read("data/#{filename}.json")).to_json
    end

    def self.get_users_total_orders(order_list)
        user_name_list = []
        for order in JSON.parse(order_list) do
            if !user_name_list.include?(order['user'])
              user_name_list.push(order['user'])
            end
        end
        user_name_list
    end
    
end