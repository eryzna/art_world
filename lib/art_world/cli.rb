class ArtWorld::CLI
  
  def call
    puts "Today's gallery openings from around the world:"
    list_events
  end
  
  def list_events
   puts <<-DOC
   1.Gallery-Exhibition Title-Location-Medium
   2.Gallery-Exhibition Title-Location-Medium
   3.Gallery-Exhibition Title-Location-Medium
   4.Gallery-Exhibition Title-Location-Medium
   5.Gallery-Exhibition Title-Location-Medium
   6.Gallery-Exhibition Title-Location-Medium
   7.Gallery-Exhibition Title-Location-Medium
   8.Gallery-Exhibition Title-Location-Medium
   9.Gallery-Exhibition Title-Location-Medium
   10.Gallery-Exhibition Title-Location-Medium
   DOC
  end
end