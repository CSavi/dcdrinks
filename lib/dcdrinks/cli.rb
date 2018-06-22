class Dcdrinks::CLI

  def call
    puts "Welcome to DC Happy Hours!"
    list_days
    list_happyhours
    goodbye
  end


  def list_days
    puts "********** Monday(1) **********"
    puts "********** Tuesday(2) **********"
    puts "********** Wednesday(3) **********"
    puts "********** Thursday(4) **********"
    puts "********** Friday(5) **********"
    puts "********** Saturday(6) **********"
    puts "********** Sunday(7) **********"
  end


  def list_happyhours
    input = nil
    while input != "exit"
      puts "Enter the number of the day to see its listed happy hours, type 'menu' to return to the main page, or type 'exit' when your search is successful."
      input = gets.strip

      if (input.to_i > 0) && (input.to_i < 9)
        Dcdrinks::HappyHour.day_selector(input)
        the_happyhour = Dcdrinks::HappyHour.create_dchappyhour[input.to_i - 1]
      elsif input == "exit"
        break
      elsif input == "menu"
        list_days
      else
        puts "Unsure what you're asking."
      end
    end
  end


  def goodbye
    puts "Thank you for using DCDrinks! See you next time!"
  end
end
