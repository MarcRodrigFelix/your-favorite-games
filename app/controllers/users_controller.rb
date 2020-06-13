class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      redirect to '/signup'
    end
      @user = current_user
      erb :login
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