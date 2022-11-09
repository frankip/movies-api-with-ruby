require "sinatra"
require "pry"

require_relative "./config/environment"
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

    post '/movies' do 
        # fetch the data posted

        payload = JSON.parse(request.body.read)
        new_movie = Movie.create(payload)
        new_movie.to_json
        # binding.pry
        # call the creat new method 
        # return the created data in json 
    end
    

    get '/movies/:id' do
        # binding.pry
        movie = Movie.find(params[:id])
        movie.to_json
    end


    put '/movies/:id' do 
        # get the instance
        movie = Movie.find(params[:id])

        # get the data from body
        # binding.pry
        # payload  =  {title: params[:title], director: params[:director]}
        payload = JSON.parse(request.body.read)
        # convert the dat to json
        movie.update(payload)

        movie.to_json

    end
    

    delete '/movies/:id' do
        movie = Movie.find(params[:id])
        movie.destroy
        movie.to_json
    end
end

run ApplicationController












# patch '/movies/:id' do
#     movie = Movie.find(params[:id])
#     data =JSON.parse(request.body.read)
#     movie.update(data)
#     movie.to_json

# end