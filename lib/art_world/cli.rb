class ArtWorld::CLI

  def call
    puts "Showing gallery openings from around the world for #{Time.now}."
    list_events
    menu
  end

  def list_events
   puts <<-DOC
   1.Gallery-Exhibition Title-Location
   2.Gallery-Exhibition Title-Location
   3.Gallery-Exhibition Title-Location
   4.Gallery-Exhibition Title-Location
   5.Gallery-Exhibition Title-Location
   6.Gallery-Exhibition Title-Location
   7.Gallery-Exhibition Title-Location
   8.Gallery-Exhibition Title-Location
   9.Gallery-Exhibition Title-Location
   10.Gallery-Exhibition Title-Location
   DOC
  end

  def menu
    input=nil
    #puts "Please input the exhibition number for more information, or type exit."
    #input=gets.strip
    while input != "exit" #&& input.to_i <= 10
      puts "Please input the exhibition number for more information, or type exit."
      input=gets.strip
      if input == "exit"
        puts "Thank you for enjoying Art World!"
        exit
      elsif input.to_i <=10
        exhibition = ArtWorld::Exhibition.all.first#.find(input.to_i)
        print_exhibition(exhibition)
      else
        puts "Input not recognized."
        menu
      end
      puts "Would you like to view another exhibition? Y or N."
      input=gets.strip.downcase
      if input == "y"
        list_events
        menu
      elsif input == "n"
        puts "Thank you for enjoying Art World!"
        exit
      else
        puts "Input not recognized."
        menu
      end

    end
  end

  def print_exhibition(exhibition)
    #puts ""
    puts "----------- #{exhibition.gallery} - #{exhibition.title} -----------"
    #puts ""
    #puts "Location:           #{restaurant.location}"
    #puts "Head Chef:          #{restaurant.head_chef}"
    #puts "Style of Food:      #{restaurant.food_style}"
    #puts "Standout Dish:      #{restaurant.best_dish}"
    #puts "Contact:            #{restaurant.contact}"
    #puts "Website:            #{restaurant.website_url}"
    #puts ""
    #puts "---------------Description--------------"
    #puts ""
    #puts "#{restaurant.description}"
    #puts ""
  end
end
