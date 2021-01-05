class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type
    @@all = []

    def initialize(fish_details) #fish_details represents a single fish element from the hash returned by the get_fish API class method
        self.name = fish_details["Species Name"]
        self.aliases = fish_details["Species Aliases"].scan(/(?<=">).+?(?=<)/)
        self.quote = fish_details["Quote"]
        self.harvest_type = fish_details["Harvest Type"]
        @@all << self #if saving here to @@all, can't also save in Wild and Farmed to their own @@all variables because it creates duplicates
        #why doesn't using self.class.all << self here allow the #all methods to work? They all return 0
    end

    def self.all #Would need custom self.all methods in the Wild and Farmed classes that select the wild and farmed fish objs from the Fish.all collection 
        @@all
    end

    #sort method

    #find_by_name_or_alias(fish_name)
        #validate the input 
        #return fish details
      
end