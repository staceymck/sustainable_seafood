class SustainableSeafood::Farmed < SustainableSeafood::Fish
    attr_accessor :feeds, :env_considerations, :farming_method

    def initialize(fish_details)
        self.feeds = fish_details["Feeds_"].strip
        self.env_considerations = fish_details["Environmental Considerations"] 
        self.farming_method = fish_details["Farming Methods"].strip
        super
    end

    def self.all
        SustainableSeafood::Fish.all.select {|fish| fish.class == self}
    end
end