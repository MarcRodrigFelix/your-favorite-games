class GamesController < ApplicationController

  get '/games' do
    authenticate
    @games = Game.all
    erb :'users/games'
  end

  get '/new_game' do
    erb :'games/new_game'
  end

  post '/new_game' do
    @game = Game.new(name: params[:name], genre: params[:genre], reason: params[:reason])
    @game.user = current_user
    if @game.save
      redirect '/games'
    else
      erb :'games/new_game'
    end    
  end

  

end