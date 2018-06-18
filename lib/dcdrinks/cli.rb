class Dcdrinks::CLI

  def call
    puts "Welcome to DC Happy Hours!"
    list_days
    goodbye
  end
  # def list_venues
  #   @venue = Dcdrinks::Venue.day
  #   @venue.each.with_index(1) {|ven, i| puts "#{i}. #{ven.name} - #{ven.location} - #{ven.time} - #{ven.feature} - #{ven.url}"}
  # end
  def list_days  #from cli
    puts "********** Monday(1) **********"
    puts "********** Tuesday(2) **********"
    puts "********** Wednesday(3) **********"
    puts "********** Thursday(4) **********"
    puts "********** Friday(5) **********"
    puts "********** Saturday(6) **********"
    puts "********** Sunday(7) **********"

  end

  def list_venues
    input = nil
    while input != "exit"
      puts "Enter the number of the day for a list of happy hours or type exit."
      input = gets.strip.downcase

      if input.to_i > 0 #&& (input.to_i < 8)
        the_venue = @venue[input.to_i - 1]
        puts "#{ven.name} - #{ven.location} - #{ven.time} - #{ven.feature} - #{ven.url}"
      elsif input == "list"
        list_venues
      else
        puts "Unsure what you're asking. Enter the happy hour day or type exit."
      end
    end
  end

  def goodbye
    puts "Thank you for using DCDrinks! See you next time!"
  end
end
