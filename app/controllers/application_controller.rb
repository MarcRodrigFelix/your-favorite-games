class ApplicationController < Sinatra::Base

  set :views, ->{ File.join(root, '../views')}
  enable :sessions
  set :session_secret, ENV['SECRET_SESSION_PW']

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

  end

end