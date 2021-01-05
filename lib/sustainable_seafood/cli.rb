class SustainableSeafood::CLI

    def call
        puts "Welcome to Sustainable Seafood!"
        display_main_menu
        main_menu_actions
    end

    def display_main_menu
        puts "To access sustainablity-related info for a specific marine species, 
        enter the species name or select a number below to view species lists.
        1. See list of all 113 species
        2. See only farmed fish
        3. See only wild fish
        
        Enter 'exit' at anytime to exit the program."
    end

    def get_user_input
        gets.strip
    end

    def main_menu_actions
            input = get_user_input
            case input
            when "1"
                puts #sorted SustainableSeafood::Fish.all - listed by name
                species_details_menu
            when "2"
                puts #sorted SustainableSeafood::Farmed.all - listed by name
                species_details_menu
            when "3"
                puts  #sorted SustainableSeafood::Wild.all - listed by name
                species_details_menu
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

    def invalid_input
        puts ""
        puts "Input not recognized. Please enter a different selection:"
    end

    def species_details_menu
        #collects user input and validates it against length of list
        #if invalid, asks for input again and gives opportunity to return to main menu
        #if valid, returns details about the fish
    end

    def exit_program #maybe clear the terminal screen using system "clear"
        puts "Thanks for using Sustainable Seafood!"
        exit
    end
end

