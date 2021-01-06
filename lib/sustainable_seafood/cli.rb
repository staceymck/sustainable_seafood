require 'pry'
class SustainableSeafood::CLI

    def call
        puts <<~HEREDOC

        ============== Welcome to Sustainable Seafood ==============

        Access sustainability-related info for 100+ marine species
         from FishWatch, the US database for sustainable seafood.
          --> For optimal viewing, use a wide terminal window <--
                                        
        ========================= ><{{{{°> =========================
        
        HEREDOC

        display_main_menu
        main_menu_actions
    end

    def display_main_menu
        puts ""
        puts <<~MAINMENU
        Enter a marine species name to search the records
        or select an option below to view species lists:

            ><{{{{°>  Enter 'all' to see all 113 species
            ><{{{{°>  Enter 'farmed' to see only farmed species
            ><{{{{°>  Enter 'wild' to see only wild species
        
        Enter 'exit' at any time to exit the program.
        MAINMENU
    end

    def get_user_input
        gets.strip
    end

    def main_menu_actions
            input = get_user_input.downcase

            if valid_list_choice?(input)
                case input 
                when "all" 
                    selected_list = SustainableSeafood::Fish
                when "farmed"
                    selected_list = SustainableSeafood::Farmed
                when "wild"
                    selected_list = SustainableSeafood::Wild
                when "exit"
                    exit_program
                end

                display_list_header(input)
                display_list_in_columns(selected_list)
                display_submenu
                submenu_actions(selected_list)

            elsif SustainableSeafood::Fish.find_by_name_or_alias(input)
                display_fish_details(input)
                display_submenu
                submenu_actions(selected_list)
        
            else
                invalid_input
                main_menu_actions
            end     
    end

    def display_submenu
        puts ""
        puts <<~SUBMENU
        To see info about a specific species, please enter the species' number, 
        or type 'main' to return to the main menu:
        SUBMENU
    end

    def valid_list_choice?(input)
        ["all", "farmed", "wild", "exit"].include?(input)
    end

    def display_list_header(keyword)
        puts ""
        puts "---------- #{keyword.capitalize} Species ---------- "
        puts ""
    end

    def invalid_input
        puts ""
        puts "Input not recognized. Please enter a different selection:"
    end

    def create_column_contents(fish_list)
        sorted_list = fish_list.sort_by_name #returns fish objects sorted alphabetically by name
        numbered_list = [] #create empty array to store numbered names
        sorted_list.each.with_index(1) {|fish, i| numbered_list << "#{i}. #{fish.name}"} #returns alphabetized, numbered list of fish names - ran into issue when using map at first because it changed fish instance variables
        cols = numbered_list.each_slice((numbered_list.size+2)/3).to_a #splits list of names into 3 arrays of closely equal size
        zip_columns = cols.first.zip(*cols[1..-1])
    end

    def display_list_in_columns(fish_list)
        create_column_contents(fish_list).each{|row| puts row.map{|fish| fish ? fish.ljust(35) : '     '}.join("  ") } 
        #the ternary statement checks if a list item is nil/false or not. Some may be nil as a result of the
        #way the create_column_contents method works. If nil, then empty string is printed.

        ### THESE COLUMNS ARE NOT RESPONSIVE, so terminal window must be certain width ####
    end

    def id_species(input, fish_list) #since column display numbers don't correlate to the actual order of fish in Fish.all, 
        #I need a special way to id the user's choice based on the number they enter | returns species name
        formatted_list = create_column_contents(fish_list).flatten.compact #flatten into non-nested array; compact removes nil values at end - this prints the list again
        user_choice = formatted_list.find {|numbered_species| numbered_species.include?(input)} #returns in form like "7. Sablefish"  
        selected_species_name = user_choice.gsub(/^\d+.\s/, "").strip #remove the number and padding added for column formatting
    end

    def submenu_actions(fish_list)
        input = gets.strip
        if input.to_i.between?(1, fish_list.all.length)
            fish_name = id_species(input, fish_list) 
            display_fish_details(fish_name)
        elsif input == "main"
            display_main_menu
            main_menu_actions
        elsif input == "exit"
            exit_program
        else
            invalid_input
            submenu_actions(fish_list)
        end
    end

    def display_fish_details(fish_name)
        fish = SustainableSeafood::Fish.find_by_name_or_alias(fish_name)

        puts ""
        puts fish.name.upcase
        puts ""
        puts "--------- AKA ---------"
        puts fish.aliases || "       No aliases      "
        puts "------ ><{{{{{°> ------"
        puts ""
        puts WordWrap.ww fish.quote, 80
        puts ""

        if fish.harvest_type == "Farmed"
            puts "Farming Methods:"
            puts WordWrap.ww fish.farming_method, 80
            puts ""
            puts "Environmental Considerations:"
            puts WordWrap.ww fish.env_considerations, 80
            puts ""
            puts "Feeds:"
            puts WordWrap.ww fish.feeds, 80
        else 
            puts "Population Status:"
            puts WordWrap.ww fish.population, 80
            puts ""
            puts "Habitat Impacts:"
            puts WordWrap.ww fish.habitat_impacts, 80
            puts ""
            puts "Fishing Rate:"
            puts WordWrap.ww fish.fishing_rate, 80
            puts ""
            puts "Bycatch:"
            puts WordWrap.ww fish.bycatch, 80
        end

        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        display_main_menu
        main_menu_actions
    end

    def exit_program #maybe clear the terminal screen using system "clear"
        puts "Thanks for using Sustainable Seafood!"
        exit
    end
end


#ASCII ART

# ><{{{{{°>

#  ooOOoo
# (OOOOOO)
# --------
# ((   ((  
#  ))   ))   
# ((   (( 
#  ))   ))

# (                   o   (
#  )  )              o     )  )
# (  (        ><{{{º>     (  (
#  )  ) ><{{{{º>           )  )
# (__(_____________________(__(



