module SustainableSeafood
  module Findable

    def find_by_name(fish_name)
      all.find {|fish| fish.name.downcase == fish_name.downcase}
    end

    def find_by_alias(fish_name)
      all.find do |fish| 
          fish.aliases.map {|alias_name| alias_name.downcase}.include?(fish_name.downcase) 
      end
    end

    def find_by_name_or_alias(fish_name)
      find_by_name(fish_name) || find_by_alias(fish_name)
    end

  end
end