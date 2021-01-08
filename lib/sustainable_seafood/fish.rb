class SustainableSeafood::Fish
    attr_accessor :name, :aliases, :quote, :harvest_type, :mercury_levels
    @@all = []

    def initialize(fish_details)
        self.name = fish_details["Species Name"].strip
        self.aliases = fish_details["Species Aliases"]
        self.quote = fish_details["Quote"].strip
        self.harvest_type = fish_details["Harvest Type"].strip
        @@all << self
    end

    def self.all
        if @@all.empty?
            SustainableSeafood::API.make_fish
            SustainableSeafood::Scraper.get_mercury_levels
        end
        @@all
    end

    def self.sort_by_name
        all.sort_by {|fish| fish.name}
    end

    def self.find_by_name(fish_name)
        all.find {|fish| fish.name.downcase == fish_name.downcase}
    end

    def self.find_by_alias(fish_name)
        all.find do |fish| 
            fish.aliases.map {|alias_name| alias_name.downcase}.include?(fish_name.downcase) 
        end
    end

    def self.find_by_name_or_alias(fish_name)
        find_by_name(fish_name) || find_by_alias(fish_name)
    end

end