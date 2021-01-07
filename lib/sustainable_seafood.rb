#originally listed/defaulted to: require "sustainable_seafood/version" 
require_relative "./sustainable_seafood/version"

#added ones below - order matters
require_relative "./sustainable_seafood/fish"
require_relative "./sustainable_seafood/fish_types/wild"
require_relative "./sustainable_seafood/fish_types/farmed"
require_relative "./sustainable_seafood/api"
require_relative "./sustainable_seafood/cli" 
require "net/http"
require "open-uri"
require "json"
require "word_wrap"
require "colorize"
#added section ends here

module SustainableSeafood
  class Error < StandardError; end
  # Your code goes here...
end
