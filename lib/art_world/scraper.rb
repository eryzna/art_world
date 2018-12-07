require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './exhibition.rb'

class ArtWorld::Scraper

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
    end
  end

  ArtWorld::Scraper.new.make_exhibitions
end
