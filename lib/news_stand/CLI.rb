
class News_Stand::CLI
  attr_accessor :news
  def call 
    greeting
    @news = News_Stand::News.new
    news.display_sources
    menu 
  end 

  def greeting 
    puts "Hello! Welcome to the CLI NewsStand!"
    puts "Here is a list of our available newspapers!"
  end 

  
  def menu 
    input = ""
    puts "Please type a number to select a newspaper."
    while input != "quit"
      input = gets.strip
      case input 
      when "list"
        news.display_sources
        puts "Which newspaper would you like to see next?"
      when "quit"
        goodbye
        exit 
      else 
        num_input = input.to_i
        puts "Here are the headlines from #{news.sources[num_input - 1]}:"
        puts "----------------------------------------------------------------"
        news.display_headlines(num_input)
        puts "----------------------------------------------------------------"
        puts "Type 'list' to select another newspaper or 'quit' to exit program."
      end 
    end 
  end

  def goodbye 
    puts "Have a nice day!"
  end 
    

end

