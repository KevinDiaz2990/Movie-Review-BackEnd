require 'pry'
class MovieService

    Tmdb::Api.key(ENV['TMDB_API_KEY'])
    #binding.pry 
    def self.result_Search(keyword)
        movie_Result = search_movie_title(keyword)
        base_url = image_base_url
        results = []
        movie_Result.each{|item|  results << {title: item['title'], image_url:"#{base_url}w185#{item['poster_path']}" }}
        return results
    end    
      
private

    def self.search_movie_title(keyword)
        search_movie = Tmdb::Search.movie(keyword)
        return search_movie['results']
    end

    def self.image_base_url
        config = Tmdb::Configuration.get
        return config.images.base_url
    end

end 

