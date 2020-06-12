class ApplicationController < Sinatra::Base

  set :views, ->{ File.join(root, '../views')}
  enable :sessions
  set :session_secret, ENV['SECRET_SESSION']

  get '/' do
    erb :index
  end

end