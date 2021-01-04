class SustainableSeafood::Farmed < SustainableSeafood::Fish
    attr_accessor :feeds, :env_impact, :farming_method

    def initialize(fish_details)
        super
        self.feeds = fish_details["Feeds_"].strip
        self.env_impact = fish_details["Environmental Considerations"] #will need to format this response
        self.farming_method = fish_details["Farming Methods"].strip
    end

    def self.all
        SustainableSeafood::Fish.all.select {|fish| fish.harvest_type == "Farmed"}
    end
end