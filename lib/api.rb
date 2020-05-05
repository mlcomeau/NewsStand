

class NewsStand::api 
    URL = "https://newsapi.org/v2/top-headlines?sources=bbc-news,abc-news,msnbc,cnn,cbs-news,fox-news,google-news,nbc-news,usa-today,newsweek&apiKey=f90e8b10cd934afb8ed3336745a67595"

    def get_news
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end 


end 
