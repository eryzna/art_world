require 'pry'
require 'nokogiri'
require 'open-uri'
class ArtWorld::Exhibition

  attr_accessor :gallery, :title, :location, :dates, :url, :address, :gallery_website, :telephone, :email

  @@all= []

  def initialize (gallery=nil, title=nil, location=nil, dates=nil, url=nil)
    @gallery=gallery
    @title=title
    @location=location
    @dates=dates
    @url=url
    @@all<<self
  end

  def self.all
    @@all
  end

  def address
    page=doc.css(".group-right").css(".adr span")
    street=page.children[1].text
    postal_code=page.children[2].text
    locality=page.children[3].text.strip
    @address="#{street}, #{postal_code} #{locality}"
  end

  def telephone
    page=doc.css(".group-right").css("a")
    @telephone=page[0].text
  end

  def email
    page=doc.css(".group-right").css("a")
    @email=page[1].text
  end

  def gallery_website
    @gallery_website=doc.css(".group-right a.button").attribute("href").value
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
