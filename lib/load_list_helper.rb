class LoadList
    def self.load(filename)
        JSON.parse(File.read("data/#{filename}.json")).to_json
    end
end