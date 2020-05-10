class News_Stand::Article 

    attr_accessor :title, :url, :source 

    @@all = []
    @@sources = []
    @@current_titles = []
 

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
        @@sources 
    end 

    def self.unique_sources
        sources.uniq 
    end 

    def self.current_titles
        @@current_titles
    end 

    
    def self.gather_sources
        i = 1 
        all.each do |article|
            sources  << article.source 
        end
    end 

    def self.display_sources 
        i = 1 
        unique_sources.each do |source|
            puts "#{i}. #{source}"
            i += 1 
        end 
    end 


    def self.get_headlines(num)
        source_chosen = unique_sources[num - 1]
        i = 1 

        all.each do |article|
            if article.source == source_chosen 
                puts "#{i}. #{article.title}"
                current_titles << article.title 
                i += 1 
            end 
        end 
    
    end 


    def self.open_article(num)
        chosen_article = current_titles[num - 1]

        all.each do |article|
            if article.title == chosen_article 
                system("xdg-open #{article.url}")            
            end 
        end 
    end 

    def self.leave_source
        current_titles.clear 
    end 
end 


