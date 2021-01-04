class SustainableSeafood::Farmed < SustainableSeafood::Fish
    attr_accessor :feeds, :env_impact, :farming_method

    def initialize(fish_details)
        self.feeds = fish_details["Feeds_"].strip
        self.env_impact = fish_details["Environmental Considerations"] #will need to format this response
        self.farming_method = fish_details["Farming Methods"].strip
        super
    end

    def self.all
        SustainableSeafood::Fish.all.select {|fish| fish.class == self}
    end
end