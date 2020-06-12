class ApplicationController < Sinatra::Base

  set :views, ->{ File.join(root, '../views')}

  get '/' do
    "Hello People"
  end

end