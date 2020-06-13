class GamesController < ApplicationController
  
  get '/new.erb' do
    erb :'games/new'
  end

  post '/new' do
    @game = Game.new(name: params[:name], genre: params[:genre], reason: params[:reason])
    @game.user = current_user
    if @game.save
      redirect '/home'
    else
      erb :'games/new'
    end    
  end

end