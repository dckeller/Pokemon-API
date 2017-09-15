require 'json'
require 'open-uri'
require 'nokogiri'
require 'net/http'

class Pokemon < ApplicationRecord
  has_many :subscriptions
  has_many :reviews
end
