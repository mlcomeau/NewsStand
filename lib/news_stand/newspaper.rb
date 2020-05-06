
class News_Stand::Newspaper
    attr_accessor :sources
    #here is a comment 

    def initialize
        #attributes.each {|key, value| self.send(("#{key}="), value)}
        @sources = []
        self.get_sources
    end 

    def display_sources
        #todo - get sources from api 
        i = 1
        sources.each do |source| 
            puts "#{i}. #{source}"
            i += 1 
        end     
    end

    def call_newsapi(url)
        uri = URI.parse(url)
        reponse = Net::HTTP.get_response(uri)
        reponse.body
    end 


    def display_headlines(num)
       headlines_url = get_headlines_url(num)
              
       articles = JSON.parse(call_newsapi(headlines_url))
       
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

    def get_sources
        sources_url = "https://newsapi.org/v2/sources?language=en&apiKey=f90e8b10cd934afb8ed3336745a67595"
               
        sources_json = JSON.parse(call_newsapi(sources_url))
        
        sources_json.collect do |key, value|
         if key == "sources"
             value.collect do |source|
                 sources << source["name"]
             end 
         end 
        end 
     end 


end 
