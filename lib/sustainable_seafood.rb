require_relative "./sustainable_seafood/version"
require_relative "./sustainable_seafood/fish"
require_relative "./sustainable_seafood/fish_types/wild"
require_relative "./sustainable_seafood/fish_types/farmed"
require_relative "./sustainable_seafood/api"
require_relative "./sustainable_seafood/cli" 
require_relative "./sustainable_seafood/scraper"
require "net/http"
require "open-uri"
require "json"
require "word_wrap"
require "colorize"
require 'nokogiri'

module SustainableSeafood
  class Error < StandardError; end
  
end
