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