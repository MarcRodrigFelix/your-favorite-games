class ApplicationController < Sinatra::Base

  set :views, ->{ File.join(root, '../views')}
  enable :sessions
  set :session_secret, ENV['SECRET_SESSION_PW']
  disable :show_exceptions

  get '/' do
    erb :'users/login'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def authenticate
      raise AuthenticationError.new if !logged_in?
    end

    def current_game
      @game ||= Game.find(params[:id])
    end

    def valid_user?
      current_game.user_id == current_user.id
    end

  end

  not_found do
    status 404
    erb :not_found, layout: false
  end

  error AuthenticationError do
    status 403
    erb :not_authorized, layout: false
  end

  error ActiveRecord::RecordNotFound do
    status 404
    erb :not_found, layout: false
  end

end