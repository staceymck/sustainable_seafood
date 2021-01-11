CLI responsibilities:

#call
1. Greets user
2. Presents user with list of menu options to choose from - could have a method for this menu
    A. See list of all fish
    B. See a list of farmed fish
    C. See a list of wild fish
    Possibility - D. Search for fish by name
    E. 'Exit' to exit - want to be able to exit at anytime in the program
3. Collect user input - this can be its own method
4. Validate the input 
5. If valid, display the user's chose as a numbered, alphabetized list
    - Will I "make fish" objects via the API class directly in the CLI class or place this role in the Fish class? If Fish.all.empty? then API.make_fish
6. Once user is presented with the list of fish, they are prompted to select a fish from the list by entering it's number
    - Would like to add the ability to search for a fish by species name or species alias
    - If I can add this ability, I could list it as an additional option in the initial menu
7. Collect user input
8. Validate user input
9. If valid, display the selected fish's attributes to the user in a nicely formatted way
    - Do I want to present all the information at once? Or present a list the user can choose from? Might depend on how much info is included for each attribute. Don't want to present too much at once.
10. User is then presented with the initial menu again - this is when a search feature could come in handy 


Might be able to print in columns using something like this:
test = [[1, 2], [3, 4], [5, 6], [7, 8]]  #first divide up the fish into arrays of equal size - 3 or 4?
test.each {|pair| puts "#{pair[0]} #{pair[1]}"} #then print the pairs in rows

#### TEST CODE ####
# test = [1, 2, 3, 4, 5, 6, 7, 8]
# num = 1
# i = 0
# while i < test.length
# puts "#{num}. #{test[i]}   #{num += 1}. #{test[i+=1]}"
# i+=1
# num+=1
# end

### Returns this ####
# How can I print nums vertically?
# 1. 1   2. 2
# 3. 3   4. 4
# 5. 5   6. 6
# 7. 7   8. 8
#  => nil 

# puts col_1 col_2 col_3
# col_1 = 1st 3rd of list - need to divide length by 3 to determine # of rows in each column


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


#### tests for API cleanup #####
# string.split(/<\/?[^>]*>|\n/).reject(&:empty?)

   ## WORKS
    #  string.gsub(/\n|<\/li>|<\/?ul>|<\/?a[^>]*>/, "") #only <li> tags left
        # string.gsub(/<li>(?=[\w\s&]+:)/, "") #<li>Water Quality & Benthic Impacts:   - matches <li> in front of colon strings
        # string.gsub("<li>", "\n• ")


        #string.split(/\n<li>/)

    # def test_2
    #     string.gsub(/\n<li>/, "• ") unless first set
    #     then remove string.gsub(/<\/?[^>]*>|\n/, " ")
    #     then string.gsub("•", "\n•")
    # end
    
#  def self.format_lists(fish_details)
        if fish_details["Environmental Considerations"] != nil
            #fish_details["Environmental Considerations"] = fish_details["Environmental Considerations"].gsub(/<\/?[^>]*>|\n/, "").gsub(/(?<=.\.)(?=.+:)/, "\n• ")
            #list = list.gsub(/<\/?[^>]*>|\n/, "").gsub("<li>", "\n• ").gsub("</ul>", "\n")    (?<=.\.)(?=.+:) < selects space before . WORD:
            #fish_details["Environmental Considerations"].gsub!(/<\/?[^>]*>|\n/, "").gsub!(/\.(?=\w)/, " ").gsub!(/:(?=\w)/, ":\n• ") #gsub!(/(?<=\s)(?=[A-Z].+:)/, "\n")
            #fish_details["Environmental Considerations"] = fish_details["Environmental Considerations"].gsub(/\n<li>/, "• ").gsub(/<\/?[^>]*>|\n/, "").gsub("•", "\n•")
            fish_details["Environmental Considerations"] = fish_details["Environmental Considerations"].gsub(/\n|<\/li>|<\/?ul>|<\/?a[^>]*>/, "").gsub(/<li>(?=[\w\s&]+:)/, "\n\n").gsub(/<li>/, "\n")
        end
    end


            puts "Thanks for using Sustainable Seafood!"


        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".blue
        puts "                        O         "
        puts "           O           o          "
        puts "          o".colorize(:blink) +"     ><{{{º>           ".cyan
        puts "         o                        "
        puts "><{{{{º>                          ".cyan
        puts "__________________________________".blue