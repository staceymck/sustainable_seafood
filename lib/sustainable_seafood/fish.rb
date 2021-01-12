class SustainableSeafood::Fish
    extend SustainableSeafood::Findable
    
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

end