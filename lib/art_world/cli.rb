require 'pry'
class ArtWorld::CLI

  def call
    puts "Showing gallery openings from around the world for #{Time.now}."
    list_events
    menu
  end

  def list_events
    exhibition=ArtWorld::Exhibition.all
    puts "1. #{exhibition[0].gallery}---#{exhibition[0].title}---#{exhibition[0].date}---#{exhibition[0].location}"
    puts "2. #{exhibition[1].gallery}---#{exhibition[1].title}---#{exhibition[1].date}---#{exhibition[1].location}"
    puts "3. #{exhibition[2].gallery}---#{exhibition[2].title}---#{exhibition[2].date}---#{exhibition[2].location}"
    puts "4. #{exhibition[3].gallery}---#{exhibition[3].title}---#{exhibition[3].date}---#{exhibition[3].location}"
    puts "5. #{exhibition[4].gallery}---#{exhibition[4].title}---#{exhibition[4].date}---#{exhibition[4].location}"
    puts "6. #{exhibition[5].gallery}---#{exhibition[5].title}---#{exhibition[5].date}---#{exhibition[5].location}"
    puts "7. #{exhibition[6].gallery}---#{exhibition[6].title}---#{exhibition[6].date}---#{exhibition[6].location}"
    puts "8. #{exhibition[7].gallery}---#{exhibition[7].title}---#{exhibition[7].date}---#{exhibition[7].location}"
    puts "9. #{exhibition[8].gallery}---#{exhibition[8].title}---#{exhibition[8].date}---#{exhibition[8].location}"
    puts "10. #{exhibition[9].gallery}---#{exhibition[9].title}---#{exhibition[9].date}---#{exhibition[9].location}"

    #binding.pry
    #puts "1."

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
      elsif input.to_i > 0
        y=ArtWorld::Exhibition.all[input.to_i-1] ###works!!! DON"T TOUCH!
        print_exhibition(y)
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
    puts ""
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
