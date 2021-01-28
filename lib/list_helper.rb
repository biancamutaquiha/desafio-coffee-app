class ListHelper
    def self.load(filename)
        JSON.parse(File.read("data/#{filename}.json")).to_json
    end
    
    def self.merge_lists(total_order, total_payment, balance)
        result_list = []
        
        total_order = JSON.parse(total_order)
        total_payment = JSON.parse(total_payment)
        balance = JSON.parse(balance)

        i = 0
        while i < total_order.size do
            result_list.push(total_order[i].merge(total_payment[i]).merge(balance[i]))
            i += 1
        end

       return result_list.to_json
    end
end