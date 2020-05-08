class News_Stand::Article 

    attr_accessor :title, :url, :name, :content 

    @@all = []
    @@headlines = []
    @@current_titles = []
 

    def initialize(article_hash)
        article_hash.each do |method, article_data|
          self.send("#{method}=", article_data) if self.respond_to?("#{method}=")
      
        end
        @name = article_hash["source"]["name"]
        @@all << self
    end 

    def self.all 
        @@all 
    end
    

    def self.headlines
        @@headlines
    end 

    def headlines 
        @@headlines
    end 

    def self.display_headlines(choice_url)
        i = 1
        all.each do |article|
            if article.name == choice_url 
                puts "#{i}. #{article.title}"
                i += 1 
                @@headlines << article.title 
            end 
        end 
    end 

    def self.open_article(num_input)
        article_index = num_input - 1 
        chosen_article = headlines[article_index]

        all.each do |article|
            if article.title == chosen_article 
                system("xdg-open #{article.url}")            
            end 
        end 
    end 

    def self.clear
        current_titles.clear 
        current_source = ""
    end 
end 


