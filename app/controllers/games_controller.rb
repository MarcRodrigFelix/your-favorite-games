class GamesController < ApplicationController
  
  get '/new_game' do
    erb :'games/new_game'
  end

  post '/new_game' do
    @game = Game.new(name: params[:name], genre: params[:genre], reason: params[:reason])
    @game.user = current_user
    if @game.save
      redirect '/home'
    else
      erb :'games/new_game'
    end    
  end

end