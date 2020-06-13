class GamesController < ApplicationController
  
  get '/new' do
  binding.pry
    erb :'games/new'
  end

  post '/new' do
binding.pry
    current_user

    erb :'users/home'
  end

end