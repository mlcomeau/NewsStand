
class News_Stand::CLI

  def call 
    greeting
    News_Stand::API.get_articles
    first_menu 
  end 

  def greeting 
    puts "Hello! Welcome to the Virtual NewsStand!"
    puts "Where you can read top headline news stories from a wide variety of sources."
    puts "You can type 'quit' at anytime to leave the virtual NewsStand."
    
  end 
    

  def first_menu
    puts "Here is a list of our available news sources!"
    puts "---------------------------------------------"
    News_Stand::Article.display_sources
    puts "---------------------------------------------"
    puts "Please type a number to select a news source."
    
    input = gets.strip 
    if input == "quit"
      goodbye 
    else 
      second_menu(input.to_i)
    end 
  end

  def second_menu(input)
    puts "Here are the top headlines from #{News_Stand::Article.sources[input - 1]}"
    puts "---------------------------------------------"
    current_headlines = News_Stand::Article.get_headlines(input)
    i = 1 
    current_headlines.each do |headline|
      puts "#{i}. #{headline}"
      i += 1 
    end 
    puts "---------------------------------------------"
    input = ""
    while input != "back"
      puts "Please type a number to open an article in your browser."
      puts "Or type 'back' to look at our list of news sources." 
      input = gets.strip 
      if input == "quit"
        goodbye
      elsif input == "back"  
        first_menu 
        break 
      else 
        chosen_headline = current_headlines[input.to_i - 1]
        News_Stand::Article.open_article(chosen_headline)
      end 
    end 

  end 


  def goodbye 
    puts "Thanks for visiting the virtual NewsStand!"
    puts "Have a nice day!"
    sleep(1)
    exit
  end 
    

end

