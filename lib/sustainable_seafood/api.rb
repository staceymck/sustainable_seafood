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
            format_apostrophes(fish_details) #has to come before format_aliases because alias method changes the alias string to an array
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
            fish_details["Environmental Considerations"] = fish_details["Environmental Considerations"].gsub(/\n|<\/li>|<\/?ul>|&nbsp;|<a.+?>|<\/a>/, "").gsub("<li>", "\n• ").gsub("</ul>", '\n').gsub("&amp;", "&")
        end

        if fish_details["Habitat Impacts"] != nil
            fish_details["Habiat Impacts"] = fish_details["Habitat Impacts"].gsub(/\n|<\/li>|<\/?ul>|&nbsp;|<a.+?>|<\/a>/, "").gsub("<li>", "\n• ").gsub("</ul>", "\n").gsub("&amp;", "&")
        end
    end

    def self.format_apostrophes(fish_details)
        fish_details.map {|k, v| fish_details[k] = v.gsub("&#039;", "'") if v.is_a? String }
    end
end


# ### GRAB FOR IRB ####
# require 'json'
# require 'net/http'
# require 'open-uri'
#     uri = URI.parse("https://www.fishwatch.gov/api/species")
#     response = Net::HTTP.get_response(uri)
#     body = JSON.parse(response.body)
    

#         body.each do |fish_details|
#             formatted_fish_details = fish_details.map {|k, v| k => v.is_a? String ? v.gsub("&#039;", "'") : v }
#             if formatted_fish_details["Harvest Type"] == "Farmed"
#                 SustainableSeafood::Farmed.new(formatted_fish_details)
#             elsif formatted_fish_details["Harvest Type"] == "Wild"
#                 SustainableSeafood::Wild.new(formatted_fish_details)
#             end
#         end

# test = {"Fishery Management"=>"test&#039;here    ", "Num" => 111, "Hash" => {"key" => "value"}, "Population" => "The population <li> level is unknown.\nThe species has </ul>a lifespan of less than one year.\n   "}
#         test.map {|k, v| v.is_a?(String) ? v.gsub("&#039;", "'").strip : v}
#         test.map {|k, v| v.is_a?(String) ? v.gsub("&#039;", "'").gsub(/\n|<\/li>|<ul>/, " ").strip : v}??


#     formatted_body = body.each {|k, v| v.gsub("&#039;", "'") if v.is_a? String}
#     pp formatted_body[4]["Species Aliases"]

# test.each {|k, v| v.gsub("&#039;", "'") if v.is_a? String}

