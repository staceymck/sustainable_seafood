class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type

    def initialize(fish_details)
        self.name = fish_details["Species Name"]
        self.aliases = fish_details["Species Aliases"]
        self.quote = fish_details["Quote"]
        self.harvest_type = fish_details["Harvest Type"]
    end
      
end