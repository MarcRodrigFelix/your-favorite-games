class UsersController < ApplicationController

  get '/login' do
    @users = User.all
    erb :home
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if !!session[:user_id]
      erb :home
    end

    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    erb :home
  end

end