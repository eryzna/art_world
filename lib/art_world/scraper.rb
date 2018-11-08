require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './exhibition.rb'

class ArtWorld::Scraper

  #attr_accessor :doc

  def get_page
    Nokogiri::HTML(open("http://www.artnet.com/events/gallery-openings/"))
    #binding.pry
  end

  def get_exhibitions
    doc=self.get_page.css(".eventArea")
    #binding.pry

  end

  def make_exhibition
    self.get_exhibitions.each do |x|
      #binding.pry
      exhibition = ArtWorld::Exhibition.new
      exhibition.gallery = x.css("h3.truncate").text
      exhibition.title = x.css("p.truncate").text
      exhibition.date = x.css("p")[1].text
      exhibition.location= x.css("p#lblcity").text
      #binding.pry
    end

  end

  def print_exhibition
    self.make_courses
    ArtWorld::Exhibition.all.each do |e|
  #    if course.title
  #      puts "Title: #{course.title}"
  #      puts "  Schedule: #{course.schedule}"
  #      puts "  Description: #{course.description}"
  #    end
  #  end
  #end

#end

ArtWorld::Scraper.new.make_exhibition

end
