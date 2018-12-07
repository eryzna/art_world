require 'pry'
require 'nokogiri'
require 'open-uri'
class ArtWorld::Exhibition

  attr_accessor :gallery, :title, :location, :dates, :contact, :url, :address, :gallery_website

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


  def initialize (gallery=nil, title=nil, location=nil, dates=nil, address=nil, contact=nil, gallery_website=nil)
    @gallery=gallery
    @title=title
    @location=location
    @dates=dates
    @address=address
    @contact=contact
    @galllery_website=gallery_website
    @@all<<self
  end

  def self.all
    @@all
  end

  def address
    page=doc.css(".group-right").css(".adr span")
    #street=page.children[0].text
    street=page.children[1].text
    postal_code=page.children[2].text
    locality=page.children[3].text.strip
    @address="#{street}, #{postal_code} #{locality}"
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  #ArtWorld::Exhibition.new_from_index(x)#_from_index(x)

#

end
