class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type
    @@all = []

    def initialize(fish_details) #fish_details represents a single fish element from the hash returned by the get_fish API class method
        self.name = fish_details["Species Name"]
        self.aliases = fish_details["Species Aliases"].scan(/(?<=">).+?(?=<)/)
        self.quote = fish_details["Quote"]
        self.harvest_type = fish_details["Harvest Type"]
        @@all << self
    end

    def self.all #Would need custom self.all methods in the Wild and Farmed classes that select the wild and farmed fish from the Fish.all collection 
        @@all
    end
      
end