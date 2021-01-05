class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type
    @@all = []

    def initialize(fish_details) #fish_details represents a single fish element from the hash returned by the get_fish API class method
        self.name = fish_details["Species Name"].strip
        self.aliases = fish_details["Species Aliases"].strip
        self.quote = fish_details["Quote"].strip
        self.harvest_type = fish_details["Harvest Type"].strip
        @@all << self #if saving here to @@all, can't also save in Wild and Farmed to their own @@all variables because it creates duplicates
        #why doesn't using self.class.all << self here allow the #all methods to work? They all return 0
    end

    def self.all #Would need custom self.all methods in the Wild and Farmed classes that select the wild and farmed fish objs from the Fish.all collection 
        SustainableSeafood::API.make_fish if @@all.empty?
        @@all
    end

    def self.sort_by_name
        all.sort_by {|fish| fish.name}
    end

    def self.find_by_name(fish_name)
        SustainableSeafood::Fish.all.find {|fish| fish.name == fish_name}
    end

    def self.find_by_name_or_alias(fish_name)
        #validate the input 
        #return fish details
    end

    def format_apostrophes(string)
        string.gsub("&#039;", "'")
    end

    def aliases=(aliases)
        alias_array = aliases.scan(/(?<=">).+?(?=<)/)
        @aliases = alias_array.map {|alias_name| format_apostrophes(alias_name)} 
    end

    def quote=(quote)
        @quote = format_apostrophes(quote)
    end
    
end