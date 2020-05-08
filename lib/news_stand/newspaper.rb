class News_Stand::Newspaper 

    attr_accessor :url, :id, :name 
    @@all = []

    def initialize (source_hash)
        source_hash.each do |value, key|
            self.send("#{value}=", key) if self.respond_to?("#{value}=")
        end
        @@all << self
    end   

    def self.all 
        @@all
    end 


    def self.display_sources
        i = 1 
        all.each do |source|
            puts "#{i}. #{source.name}"
            i += 1 
        end 
    end 

    def self.get_newspaper(input)
        index = input - 1 
        all[index].name 
    end 

end 
