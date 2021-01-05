require 'pry'
class SustainableSeafood::CLI

    def call
        puts "Welcome to Sustainable Seafood!"
        display_main_menu
        main_menu_actions
    end

    def display_main_menu
        puts "To access sustainablity-related info for a specific marine species, 
        enter the species name or select an option below to view species lists.
        ><{{{{º>  Enter 'all' to see all 113 species
        ><{{{{º>  Enter 'farmed' to see only farmed species
        ><{{{{º>  Enter 'wild' to see only wild species
        
        Enter 'exit' at anytime to exit the program."
    end

    def get_user_input
        gets.strip
    end

    def main_menu_actions
            input = get_user_input.capitalize

            case input
            when "All"
                header(input)
                display_list(SustainableSeafood::Fish)
                species_details_menu(SustainableSeafood::Fish.all)
            when "Farmed"
                header(input)
                display_list(SustainableSeafood::Farmed)
                species_details_menu(SustainableSeafood::Farmed.all)
            when "Wild"
                header(input)
                display_list(SustainableSeafood::Wild)
                species_details_menu(SustainableSeafood::Wild.all)
            when /exit/i
                exit_program
            else
                # if find_by_name_or_alias(input)
                #     #display fish details
                # else
                    invalid_input
                    main_menu_actions
                #end
            end  
    end

    def header(keyword)
        puts ""
        puts "---------- #{keyword} Species ---------- "
        puts ""
    end

    def invalid_input
        puts ""
        puts "Input not recognized. Please enter a different selection:"
    end

    def display_list(fish_collection)
        sorted_list = fish_collection.sort_by_name #returns fish objects sorted alphabetically by name
        numbered_list = []
        sorted_list.each.with_index(1) {|fish, i| numbered_list << "#{i}. #{fish.name}"} #returns alphabetized, numbered list of fish names - ran into issue when using map at first because it changed fish instance variables
        cols = numbered_list.each_slice((numbered_list.size+2)/3).to_a #splits list of names into 3 arrays of closely equal size
        cols.first.zip(*cols[1..-1]).each{|row| puts row.map{|fish| fish ? fish.ljust(35) : '     '}.join("  ") } #the zip adds in nil values, which I don't want because I get an error for ljust on nil class
    end

    def species_details_menu(collection)
        puts "To see info about a specific species, please enter the species' number,
        or type 'main' to return to the main menu:"
        input = gets.strip
        if input.to_i.between?(1, collection.length)
            puts "info here" #return fish details
        elsif input == "main"
            display_main_menu
            main_menu_actions
        elsif input == "exit"
            exit_program
        else
            invalid_input
        end
    end

    def exit_program #maybe clear the terminal screen using system "clear"
        puts "Thanks for using Sustainable Seafood!"
        exit
    end
end




