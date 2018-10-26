require 'pry'
require 'nokogiri'
require 'open-uri'

class ArtWorld::Scraper
  
  #attr_accessor :doc
  
  def get_page
    Nokogiri::HTML(open("http://www.artnet.com/events/gallery-openings/"))
  end
  binding.pry
end


  
  