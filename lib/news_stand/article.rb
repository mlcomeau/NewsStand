class News_Stand::Article 

    attr_accessor :title, :url, :source 

    @@all = [] 

    def initialize(article_hash)
        article_hash.each do |method, article_data|
          self.send("#{method}=", article_data) if self.respond_to?("#{method}=")
        end
        @source = article_hash["source"]["name"]
        @@all << self
    end 

    def self.all 
        @@all 
    end

    def self.sources 
        @@all.collect { |article| article.source }.uniq 
    end 

    def self.get_headlines(chosen_source)
        all.collect do |article|
            if article.source == chosen_source 
                article.title 
            end 
        end.compact  
    end 

    def self.open_article(chosen_headline)
        all.each do |article|
            if article.title == chosen_headline 
                system("xdg-open #{article.url}")            
            end 
        end 
    end 

end 


