class SustainableSeafood::API
    URL = "https://www.fishwatch.gov/api/species"

    def self.get_fish
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

    def self.make_fish #when is the best time to call this? and where? Does it make sense to store it in the Fish class? 
        get_fish.each do |fish_details|
            if fish_details["Harvest Type"] == "Farmed"
                SustainableSeafood::Farmed.new(fish_details)
            elsif fish_details["Harvest Type"] == "Wild"
                SustainableSeafood::Wild.new(fish_details)
            end
        end
    end
end

    # Create a separate method for dividing the fish, or do it all in the make_fish method since
    # this way requires instance variables? 
    # def id_by_harvest_type
    #     #separate wild and farmed fish within results
    #     @wild = []
    #     @farmed = []
    #     get_fish.each do |fish|
    #         if fish["Harvest Type"] == "Farmed"
    #             farmed << fish
    #         elsif fish["Harvest Type"] == "Wild"
    #             wild << fish
    #         end
    #     end
    # end


