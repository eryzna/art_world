require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './exhibition.rb'

class ArtWorld::Scraper

  #attr_accessor :doc

  def get_page
    Nokogiri::HTML(open("http://www.artnet.com/events/gallery-openings/"))
  end

  def get_exhibitions
    doc=self.get_page.css(".eventArea")
  end


  def make_exhibitions
    self.get_exhibitions.each do |x|
      exhibition = ArtWorld::Exhibition.new
      exhibition.gallery = x.css("h3.truncate").text
      exhibition.title = x.css("p.truncate").text
      exhibition.date = x.css("p")[1].text
      exhibition.location= x.css("p#lblcity").text
      exhibition.url="http://www.artnet.com#{x.css("a").attribute("href").text}"

      binding.pry #<<<<<<<<<<<<<
    end
    #binding.pry
  end

  #def scrape_profile
      #exhibition = ArtWorld::Exhibition.new
      #exhibition.gallery = x.css("h3.truncate").text
      #exhibition.title = x.css("p.truncate").text
      #exhibition.date = x.css("p")[1].text
      #exhibition.location= x.css("p#lblcity").text
      #binding.pry



#  def print_exhibitions
  #  self.make_exhibitions
  #  ArtWorld::Exhibition.all.each do |y|
  #    if y.gallery
  #      puts "Gallery: #{y.gallery}"
  #      puts "Title: #{y.title}"
  #      puts "Date: #{y.date}"
  #      puts "Location: #{y.location}"
  #      binding.pry
  #    end
  #  end
  #end

#  binding.pry
    #  end
    #end
#  end
  ArtWorld::Scraper.new.make_exhibitions
end


#end

#ArtWorld::Scraper.new.print_courses


  #def make_exhibitions
    #get_exhibitions.each do |x|
      #ArtWorld::Exhibition.new_from_index(x)
    #end
  #end
  #ArtWorld::Scraper.new.make_exhibitions
#end




  #def make_exhibition
  #  self.get_exhibitions.each do |x|
      #binding.pry
  #    exhibition = ArtWorld::Exhibition.new
  #    exhibition.gallery = x.css("h3.truncate").text
    #  exhibition.title = x.css("p.truncate").text
  #    exhibition.date = x.css("p")[1].text
    #  exhibition.location= x.css("p#lblcity").text
      #binding.pry
  #  end

  #end

  #def print_exhibition
  #  self.make_courses
  #  ArtWorld::Exhibition.all.each do |e|
  #    if course.title
  #      puts "Title: #{course.title}"
  #      puts "  Schedule: #{course.schedule}"
  #      puts "  Description: #{course.description}"
  #    end
  #  end
  #end

#end

#ArtWorld::Scraper.new.make_exhibition

#end
