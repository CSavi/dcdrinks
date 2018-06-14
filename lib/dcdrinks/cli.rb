class Dcdrinks::CLI

  def call
    puts "Welcome to DC Happy Hours!"
    list_days
    #list_venues
    goodbye
  end

  def list_venues
    @venue = Dcdrinks::Venue.day
    @venue.each.with_index(1) {|ven, i| puts "#{i}. #{ven.name} - #{ven.location} - #{ven.time} - #{ven.feature} - #{ven.url}"}
  end

  def list_days
    input = nil
    while input != "exit"
      puts "Enter the number of the day for a list of happy hours or type list to see the happy hours or type exit."
      input = get.strip.downcase
      
      if input.to_i > 0
        the_venue = @venue[input.to_i - 1]
        puts "#{ven.name} - #{ven.location} - #{ven.time} - #{ven.feature} - #{ven.url}"}"
      elsif input == "list"
        list_venues
      else
        puts "Unsure what you want. Type list or exit."
      end
    end
  end

  def goodbye
    puts "Thank you for using DCDrinks! See you next time!"
  end
end
