class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type
    @@all = []

    def initialize(fish_details) #fish_details represents a single fish element from the hash returned by the get_fish API class method
        #fish_details.each {|k, v| v.gsub("&#039;", "'") if v.is_a? String} - need a way to fix all apostrophes
        self.name = fish_details["Species Name"].strip
        self.aliases = fish_details["Species Aliases"]
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

    # def format_apostrophes(fish_details)
    #     fish_details.each {|k, v| v.gsub("&#039;", "'") if v.is_a? String}
    # end

    # def aliases=(aliases)
    #     @aliases = aliases.scan(/(?<=">).+?(?=<)/)
    #      = alias_array.map {|alias_name| format_apostrophes(alias_name)} 
    # end
end