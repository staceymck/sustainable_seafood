class SustainableSeafood::API
    URL = "https://www.fishwatch.gov/api/species"

    def self.get_fish
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

    def self.make_fish
        get_fish.each do |fish_details|

            format_special_chars(fish_details) 
            format_aliases(fish_details)
            format_lists(fish_details)

            if fish_details["Harvest Type"] == "Farmed"
                SustainableSeafood::Farmed.new(fish_details)
            elsif fish_details["Harvest Type"] == "Wild"
                SustainableSeafood::Wild.new(fish_details)
            end
        end
    end

    ##### DATA CLEANUP METHODS ######
    def self.format_special_chars(fish_details) 
        fish_details.each {|k, v| fish_details[k] = v.gsub("&#039;", "'").gsub("&amp;", "&").gsub("&nbsp;", "") if v.is_a? String}
    end
    
    def self.format_aliases(fish_details)
        fish_details["Species Aliases"] = fish_details["Species Aliases"].scan(/(?<=">).+?(?=<)/)
    end

    def self.format_lists(fish_details)
        list = fish_details["Environmental Considerations"]
        unless list == nil
            list.gsub!(/\n|<\/li>|<\/?ul>|<\/?a[^>]*>/, "").gsub!(/(?<=[^\A])<li>(?=[\w\s&]+:)/, "\n\n")
            list.gsub!(/<li>/, "\n• ").gsub!(/\A\n•\s/, "")
        end
    end

end