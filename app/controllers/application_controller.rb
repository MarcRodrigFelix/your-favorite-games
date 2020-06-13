class ApplicationController < Sinatra::Base

  set :views, ->{ File.join(root, '../views')}
  enable :sessions
  set :session_secret, ENV['SECRET_SESSION_PW']

  get '/' do
    erb :index
  end

  get '/home' do
    @user = current_user
    erb :home
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def authenticate
      redirect '/login' if !logged_in?
    end
  end

end