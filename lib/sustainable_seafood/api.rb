class SustainableSeafood::API
    URL = "https://www.fishwatch.gov/api/species"

    def self.get_fish
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

    def self.make_fish
        get_fish.each do |fish_details|
            ##### CLEANUP DATA ######
            format_chars(fish_details) #has to come before format_aliases because alias method changes the alias string to an array
            format_aliases(fish_details)
            format_lists(fish_details)

            if fish_details["Harvest Type"] == "Farmed"
                SustainableSeafood::Farmed.new(fish_details)
            elsif fish_details["Harvest Type"] == "Wild"
                SustainableSeafood::Wild.new(fish_details)
            end
        end
    end


    ##### DATA FORMATTING METHODS ######
    def self.format_aliases(fish_details)
        fish_details["Species Aliases"] = fish_details["Species Aliases"].scan(/(?<=">).+?(?=<)/)
    end

    def self.format_lists(fish_details)
        if fish_details["Environmental Considerations"] != nil
            fish_details["Environmental Considerations"] = fish_details["Environmental Considerations"].gsub(/\n|<\/li>|<\/?ul>|<\/?a[^>]*>/, "").gsub(/(?<=[^\A])<li>(?=[\w\s&]+:)/, "\n\n").gsub(/<li>/, "\n• ").gsub(/\A\n•\s/, "")
        end
    end

    def self.format_chars(fish_details) #using 'fish_details[k]' = v.gsub... edits the original fish_details contents 
        fish_details.each {|k, v| fish_details[k] = v.gsub("&#039;", "'").gsub("&amp;", "&").gsub("&nbsp;", "") if v.is_a? String}
    end
end

