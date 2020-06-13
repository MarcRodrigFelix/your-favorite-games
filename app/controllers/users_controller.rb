class UsersController < ApplicationController

  get '/login' do
    if logged_in?
      @user = current_user
      erb :login
    else
      redirect to '/signup'
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