
class News_Stand::Newspaper
    attr_accessor :sources

    def initialize
        #attributes.each {|key, value| self.send(("#{key}="), value)}
        @sources = ["ABC News", "BBC News", "CBS News", "CNN", "Fox News", "Google News", "MSNBC", "NBC News", "Newsweek", "USA Today"]
    end 

    def display_sources
        i = 1
        sources.each do |source| 
            puts "#{i}. #{source}"
            i += 1 
        end     
    end

    def get_articles(url)
        uri = URI.parse(url)
        reponse = Net::HTTP.get_response(uri)
        reponse.body
    end 


    def display_headlines(num)
       headlines_url = get_headlines_url(num)
              
       articles = JSON.parse(get_articles(headlines_url))
       
       articles.collect do |key, value|
        if key == "articles"
            i = 1
            value.collect do |article|
                puts "#{i}. #{article["title"]}"
                i += 1
            end 
        end 
       end 
    end 

    def get_headlines_url(num)
        source_name = sources[num - 1].downcase.sub(/[ ]/, "-")

        first_part = "https://newsapi.org/v2/top-headlines?sources="
        last_part = "&apiKey=f90e8b10cd934afb8ed3336745a67595"

        headlines_url = first_part + source_name + last_part 
        headlines_url 
    end 


end 
