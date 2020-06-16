class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/games"
    end
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/games'
    else
      erb :'users/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/games"
    else
      @error = "Invalid Username or Password"
      erb :'users/login'
    end
  end

  delete '/logout' do
    session.clear
    redirect '/login'
  end


end