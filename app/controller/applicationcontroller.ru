require "sinatra"
# require "pry"

# require_relative "./config/environment"
# use Rack::JSONBodyParser

class ApplicationController < Sinatra::Base

    set :default_content_type, "application/json"

    # get '/views/' do 
    #  erb:index 
    # end

    get '/' do
        "Hello World"
    end

    get '/movies' do 
        # fetch all movie data from database
        movies = Movie.all
        # convert the movies to json 
        movies.to_json
    end

    get '/movies/:id' do
        # binding.pry
        movie = Movie.find(params[:id])
        movie.to_json
    end

   

    delete '/movies/:id' do
        movie = Movie.find(params[:id])
        movie.destroy
        movie.to_json
    end
end









    # post '/movies' do 
    #     data =JSON.parse(request.body.read)
    #     # binding.pry
    #     new_movie = Movie.create(data)
    #     new_movie.to_json
    # end



# patch '/movies/:id' do
#     movie = Movie.find(params[:id])
#     data =JSON.parse(request.body.read)
#     movie.update(data)
#     movie.to_json

# end