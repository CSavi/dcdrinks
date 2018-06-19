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
      puts "Enter the number of the day for a list of happy hours or type exit."
      input = gets.strip.downcase

      if input.to_i > 0
        the_happyhour = happyhour_day[input.to_i - 1]
        puts "#{hh.name} - #{hh.location} - #{hh.time} - #{hh.feature} - #{hh.url}"
      elsif input == "exit"
        break
      else
        puts "Unsure what you're asking. Select a happy hour list by entering a day's number or type 'exit'."
      end
    end
  end

  def happyhour_day
    @happyhour_for_day = Dcdrinks::HappyHour.scrape_dchappyhours
    @happyhour_for_day.each.with_index(1) {|ven, i| puts "#{i}. #{hh.name} - #{hh.location} - #{hh.time} - #{hh.feature} - #{hh.url}"}
  end

  def goodbye
    puts "Thank you for using DCDrinks! See you next time!"
  end
end
