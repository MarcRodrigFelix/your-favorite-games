class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/games'
    else
      erb :'users/signup'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/games'
    else
      @error = "Invalid Username or Password"
      erb :'users/login'
    end
  end


end