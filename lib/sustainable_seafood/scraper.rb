class SustainableSeafood::Scraper
    URL = "https://www.fda.gov/food/consumers/advice-about-eating-fish"

    def self.get_mercury_levels
        doc = Nokogiri::HTML(open(URL))

        fish_table = doc.css("#customTable tbody").first 

        fish_table.css("tr").each do |row|
            fish = row.css("td")[0].text
            mercury = row.css("td")[1].text

            if SustainableSeafood::Fish.find_by_name(fish)
                SustainableSeafood::Fish.find_by_name(fish).mercury_levels = mercury
            end
        end
    end
end