
class News_Stand::API

    def self.get_articles

        response = HTTParty.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=" + ENV['API_KEY'])

        articles = response["articles"]

        articles.each do |article_hash|
            News_Stand::Article.new(article_hash)
        end 
    end 

end 



