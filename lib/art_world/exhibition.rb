class ArtWorld::Exhibition

  attr_accessor :gallery, :title, :date, :location, :dates, :contact, :artists

  @@all= []

  def self.new_from_index_page#(r)
    self.new
   #self.new(
     #r.css("h2").text,
     #"https://www.theworlds50best.com#{r.css("a").attribute("href").text}",
     #r.css("h3").text,
     #r.css(".position").text
     #)
 end

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



end
