class Dcdrinks::CLI

  def call
    puts "Welcome to DC Happy Hours!"
    list_days
    list_happyhours
    goodbye
  end


  def list_days
    puts "Enter the number of the day for a list of happy hours or type exit."
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
      input = gets.strip

      if (input.to_i > 0) && (input.to_i < 9)
        the_happyhour = Dcdrinks::HappyHour.create_dchappyhour[input.to_i - 1]
      #  puts "#{the_happyhour[:name]} - #{the_happyhour[:location]} - #{the_happyhour[:time]} - #{the_happyhour[:feature]}"
      elsif input == "exit"
        break
      else
        puts "Unsure what you're asking. Please select numbers 1-7 or type 'exit'."
      end
    end
  end


  def goodbye
    puts "Thank you for using DCDrinks! See you next time!"
  end
end
