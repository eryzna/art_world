require 'pry'
require 'nokogiri'
require 'open-uri'
class ArtWorld::Exhibition

  attr_accessor :gallery, :title, :date, :location, :dates, :contact, :artists, :url

  @@all= []

  #def self.todays_exhibitions(x)
  #  self.new(
  #  x.css("h3.truncate").text,
  #  x.css("p.truncate").text
  #  x.css("p")[1].text
  #  x.css
  #  )
  #  binding.pry
    #ArtWorld::Scraper.new
    #self.gallery= x.css("h3.truncate").text
  #  self.title= x.css("p.truncate").text
    #self.date= x.css("p")[1].text
    #self.location= x.css("p#lblcity").text
    #self.new
    #binding.pry
    #  e.css("h3.truncate").text,
    #  e.css("p.truncate").text,
    #  e.css("p")[1].text,
    #  e.css("p#lblcity").text
    #  )
  #end

   #self.new(
     #r.css("h2").text,
     #"https://www.theworlds50best.com#{r.css("a").attribute("href").text}",
     #r.css("h3").text,
     #r.css(".position").text
     #)


  def initialize (gallery=nil, title=nil, date=nil, location=nil)
    @gallery=gallery
    @title=title
    @date=date
    @location=location
    @@all<<self
  end

  def self.all
    @@all
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  #ArtWorld::Exhibition.new_from_index(x)#_from_index(x)

#

end
