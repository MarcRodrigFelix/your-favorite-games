class UsersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    binding.pry
    
  end

end