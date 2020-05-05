require '../lib/newspaper.rb'

class CLI
  attr_accessor :newspapers
  def call 
    greeting
    @newspapers = Newspaper.new
    newspapers.display_sources
    menu 
  end 

  def greeting 
    puts "Hello! Welcome to the CLI NewsStand!"
    puts "Here is a list of our available newspapers!"
  end 

  
  def menu 
    input = nil
    until input == "exit"
      puts "Please type a number to select a newspaper."
      puts "Or, you can type 'exit' to close this program."
      input = gets.strip.to_i
      #todo: fix the hard code 
      if input > 0 && input < 11 
        newspapers.display_headlines(input)
        puts "If you would like to see headlines from another newspaper please type 'list'."
      elsif input == "list"
        newspapers.display_sources
      else 
        puts "Please choose a number between 1-10."
      end
    end
  end 
    

end 
