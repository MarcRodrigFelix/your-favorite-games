class ApplicationController < Sinatra::Base

  set :views, ->{ File.join(root, '../views')}
  enable :sessions
  set :session_secret, ENV['SECRET_SESSION_PW']

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def authenticate
      redirect '/login' if !logged_in?
    end

    def current_game
      @game ||= Game.find_by(id: params[:id])
    end
  end

end