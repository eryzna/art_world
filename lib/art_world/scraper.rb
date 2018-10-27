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
    doc=self.get_page.css(".eventsArea")
    binding.pry

  end

  def make_exhibition
    self.get_exhibitions.each do |x|
      #binding.pry
      exhibition = ArtWorld::Exhibition.new
      exhibition.title = x.css("h3").text
      binding.pry
    end
  end
      #course.schedule = post.css(".date").text
      #course.description = post.css("p").text
    #end
  #end
  #def print_courses
  #  self.make_courses
    #Course.all.each do |course|
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
