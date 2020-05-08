
class News_Stand::CLI
  attr_accessor :news
  def call 
    greeting
    News_Stand::API.get_newspapers
    News_Stand::Newspaper.display_sources
    News_Stand::API.get_articles 
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
        News_Stand::Article.display_sources
        puts "Which newspaper would you like to see next?"
      when "quit"
        goodbye
        exit 
      else 
        num_input = input.to_i
        newspaper = News_Stand::Newspaper.get_newspaper(num_input)  
        puts "Here are the headlines from: #{newspaper}"
        puts "----------------------------------------------------------------"
        News_Stand::Article.display_headlines(newspaper)
        puts "----------------------------------------------------------------"
        puts "Please type a number to select an article. It will open in your browser."
        puts "Type 'list' to select another newspaper or 'quit' to exit program."
        article_choice = nil
        while article_choice != "quit"
          article_choice = gets.strip
          case article_choice 
          when "list"
            News_Stand::Article.clear
            News_Stand::Article.display_sources
            puts "Which newspaper would you like to see next?"
          when "quit"
            goodbye 
            exit 
          else 
            article_num = article_choice.to_i 
            puts "Your article is opening in your browser."
            
            News_Stand::Article.open_article(article_num)

            puts "Type another number to open another article. Type 'list' to go back to all newspapers."
            puts "Or type 'quit' to exit the program."
          end 
        end 

          
          
      end 
    end 
  end

  def goodbye 
    puts "Have a nice day!"
  end 
    

end

