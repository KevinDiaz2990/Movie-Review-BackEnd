require 'pry'
class MovieService

    Tmdb::Api.key(ENV['TMDB_API_KEY'])
    def self.result_Search(keyword)
        movie_Result = search_movie_title(keyword)
        results = list_Movie(movie_Result)
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
    def self.list_Movie(list_movies_array)
        result_movie_array = []
        base_url = image_base_url
        list_movies_array.each do |item|
            if item['poster_path'] == nil
                result_movie_array << {title: item['title'] }
            else     
                result_movie_array << {title: item['title'], image_url:"#{base_url}w185#{item['poster_path']}" }
            end
        end    
        return result_movie_array
    end
end 

