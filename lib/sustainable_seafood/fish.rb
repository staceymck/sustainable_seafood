class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type, :mercury_levels
    @@all = []

    def initialize(fish_details)
        self.name = fish_details["Species Name"].strip
        self.aliases = fish_details["Species Aliases"]
        self.quote = fish_details["Quote"].strip
        self.harvest_type = fish_details["Harvest Type"].strip
        @@all << self #if saving here to @@all, can't also save in Wild and Farmed to their own @@all variables because it creates duplicates
        #why doesn't using self.class.all << self here allow the #all methods to work? They all return 0
    end

    def self.all #Would need custom self.all methods in the Wild and Farmed classes that select the wild and farmed fish objs from the Fish.all collection 
        if @@all.empty?
            SustainableSeafood::API.make_fish
            SustainableSeafood::Scraper.get_mercury_levels
        end
        @@all
    end

    def self.sort_by_name
        all.sort_by {|fish| fish.name}
    end

    ### How can I make these methods exclusive to the Fish class? Create a module? ###

    def self.find_by_name(fish_name)
        SustainableSeafood::Fish.all.find {|fish| fish.name.downcase == fish_name.downcase}
    end

    def self.find_by_alias(fish_name)
        SustainableSeafood::Fish.all.find do |fish| 
         fish.aliases.map {|alias_name| alias_name.downcase}.include?(fish_name.downcase) 
        end
    end

    def self.find_by_name_or_alias(fish_name)
        find_by_name(fish_name) || find_by_alias(fish_name)
    end

end