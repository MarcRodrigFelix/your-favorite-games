class UsersController < ApplicationController

  get '/login' do
    if logged_in?
      erb :home
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    erb :home
  end


end