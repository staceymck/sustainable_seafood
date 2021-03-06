class SustainableSeafood::Wild < SustainableSeafood::Fish
    attr_accessor :population, :habitat_impacts, :fishing_rate, :bycatch

    def initialize(fish_details)
        self.population = fish_details["Population"].strip
        self.habitat_impacts = fish_details["Habitat Impacts"].strip
        self.fishing_rate = fish_details["Fishing Rate"].strip
        self.bycatch = fish_details["Bycatch"].strip
        super
    end

    def self.all
        SustainableSeafood::Fish.all.select {|fish| fish.class == self}
    end
end