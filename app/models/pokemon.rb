require 'json'
require 'open-uri'
require 'nokogiri'
require 'net/http'

class Pokemon < ApplicationRecord
  has_many :subscriptions
  has_many :reviews

  # def choose_pokemon(pokedex)
  #   $url = URI("http://pokeapi.co/api/v2/pokemon/#{pokedex}/")
  # end

  # def show_pokemon
  #   puts "Pokemon: #{$name.capitalize} ID: #{$id}"
  #   puts "#{$name.capitalize} is a #{$type.capitalize} type Pokemon.  They usually have a height of #{height}', and weigh around #{weight} pounds."
  #   puts "#{$hp.upcase}: #{$base_hp}"
  #   puts "#{$attack.capitalize}: #{$base_attack}"
  #   puts "#{$defense.capitalize}: #{$base_defense}"
  #   puts "#{$speed.capitalize}: #{$base_speed}"
  # end
end
