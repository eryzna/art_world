require 'pry'
require 'nokogiri'
require 'open-uri'
#require 'mechanize'
#require 'watir'


require_relative './exhibition.rb'

class ArtWorld::Scraper

  #attr_accessor :doc

  def get_page
    Nokogiri::HTML(open("https://frieze.com/on-view?field_location_city_mask=All&field_date_value=2&recommended=All"))
  end

  def get_exhibitions
    doc=self.get_page.css(".views-row")
  end


  def make_exhibitions
    self.get_exhibitions.each do |x|
      exhibition = ArtWorld::Exhibition.new
      exhibition.gallery = x.css("a")[2].text 
      exhibition.title = x.css("a")[1].text 
      exhibition.location = x.css("h4")[0].text 
      date_start=x.css(".date-display-start")[0].text 
      date_end=x.css(".date-display-end")[0].text 
      exhibition.dates= "#{date_start} - #{date_end}" 
      exhibition.url="https://frieze.com#{x.css("a")[2].attribute("href").value}"
      #self.get_profile_page(url)
    end
    #binding.pry
  end

  #def get_profile_page(url)
  #  doc=Nokogiri::HTML(open(url))
  #  page=doc.css(".group-right").css(".adr span")
  #  #street=page.children[0].text
  #  street=page.children[1].text
  #  postal_code=page.children[2].text
  #  locality=page.children[3].text.strip
  #  address="#{street}, #{postal_code} #{locality}"
  #  telephone=
  #  
  #  binding.pry
  #end
   #self.get_exhibitions.each do |r|
     #url="https://frieze.com#{r.css("a")[1].attribute("href").value}"
     
     
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
