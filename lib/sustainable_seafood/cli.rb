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
        @input.to_i.between?(1...4) || @input.downcase == "exit"
    end

    def exit_program #maybe clear the terminal screen using system "clear"
        puts "Thanks for using Sustainable Seafood!"
        exit
    end
end