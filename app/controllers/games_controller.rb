class GamesController < ApplicationController

  get '/games' do
    authenticate
    @games = Game.all
    erb :'users/games'
  end

  get '/games/:id' do
    @game = Game.find_by(id: params[:id])
    erb :'games/show'
  end

  get '/games/new' do
    erb :'games/new'
  end

  post '/games/new' do
    @game = Game.new(name: params[:name], genre: params[:genre], reason: params[:reason])
    @game.user = current_user
    if @game.save
      redirect '/games'
    else
      erb :'games/new'
    end
  end

  get '/games/:id/delete' do

  end  

end