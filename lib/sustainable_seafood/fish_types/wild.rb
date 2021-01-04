class SustainableSeafood::Wild < SustainableSeafood::Fish
    attr_accessor :population, :habitat_impacts, :fishing_rate, :bycatch

    def initialize(fish_details)
        super
        self.population = fish_details["Population"].strip
        self.habitat_impacts = fish_details["Habitat Impacts"].strip
        self.fishing_rate = fish_details["Fishing Rate"].strip
        self.bycatch = fish_details["Bycatch"].strip
    end

    def self.all #should I set up 'all' as a class instance variable on the Fish class or overwrite the reader like this?
        SustainableSeafood::Fish.all.select {|fish| fish.harvest_type == "Wild"}
    end
end