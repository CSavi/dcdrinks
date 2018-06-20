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
        the_happyhour = happyhour_day[input.to_i - 1] #set variable equal to output to scraper; set that to the_happyhour; @the_happyhour
        puts "#{the_happyhour[:name]} - #{the_happyhour[:location]} - #{the_happyhour[:time]} - #{the_happyhour[:feature]}"
      elsif selected_day == "1"
        puts "You selected Monday."
      elsif selected_day == "2"
        puts "You selected Tuesday."
      elsif selected_day == "3"
        puts "You selected Wednesday."
      elsif selected_day == "4"
        puts "You selected Thursday."
      elsif selected_day == "5"
        puts "You selected Friday."
      elsif selected_day == "6"
        puts "You selected Saturday."
      elsif selected_day == "7"
        puts "You selected Sunday."
      elsif input == "exit"
        break
      else
        puts "Unsure what you're asking. Please select numbers 1-7 or type 'exit'."
      end
    end
  end

  def happyhour_day
    @happyhour_for_day = Dcdrinks::HappyHour.scrape_dchappyhours
    @happyhour_for_day.each.with_index(1) {|hh, i| puts "#{i}. #{hh[:name]} - #{hh[:location].strip} - #{hh[:time].strip} - #{hh[:feature]}"}
  end

  def goodbye
    puts "Thank you for using DCDrinks! See you next time!"
  end
end
