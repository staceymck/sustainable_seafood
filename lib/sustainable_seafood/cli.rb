class SustainableSeafood::CLI

    def call
        puts "Welcome to Sustainable Seafood!"
        puts "Access sustainability-related data for 100+ marine species"

        while @input != "exit"
            main_menu
            get_input
            #validate input
        end
    end

    def main_menu
        puts "Please select an option below. Enter the menu option's number to get started:
        1. See list of all 113 species
        2. See only farmed fish
        3. See only wild fish
        4. Search for species by name

        You can enter 'exit' at anytime to exit the program."
    end

    def get_input
        @input = gets.strip
    end

    def validate_input_main_menu
        if @input.to_i.between?(1...4)

            case @input
            when "1"
                puts #sorted SustainableSeafood::Fish.all - listed by name
            when "2"
                puts #sorted SustainableSeafood::Farmed.all - listed by name
            when "3"
                puts #sorted SustainableSeafood::Wild.all - listed by name
            when "4"
                puts "Please enter the name of the species you'd like to look up:"
                get_input 
                #validate here or validate within the find_by_name_or_alias method?
                find_by_name_or_alias(@input)
            end 

        elsif @input.downcase == "exit"
            exit_program
        else
            puts "Input not recognized. Please enter 1, 2, 3, 4 or exit."
            get_input
        end


    end

    def exit_program #maybe clear the terminal screen using system "clear"
        puts "Thanks for using Sustainable Seafood!"
        exit
    end
end