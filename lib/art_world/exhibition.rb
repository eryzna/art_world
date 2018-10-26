class ArtWorld::Exhibition
  
  attr_accessor :gallery, :title, :location, :dates, :contact, :artists
  
  @@all= []
  
  def initialize (gallery=nil, title=nil, location=nil)
    @gallery=gallery
    @title=title
    @location=location
    @@all<<self
  end
end