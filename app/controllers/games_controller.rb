class GamesController < ApplicationController

  get '/games' do
    authenticate
    @games = current_user.games
    erb :'users/games'
  end

  get '/games/new' do
    authenticate
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

  get '/games/:id' do #loads show.erb to show game details
    @game = Game.find_by(id: params[:id])
    erb :'games/show'
  end

  get '/games/:id/edit' do
    authenticate
    @game = Game.find_by(id: params[:id])
    erb :'games/edit'
  end

  patch '/games/:id' do
    authenticate
  if params[:name] == "" || params[:genre] == "" || params[:reason] == ""
    @error = "Looks like something is wrong, try to fill out all the fields."
    erb :'/games/edit'
  end
    @game = Game.find_by(id: params[:id])
    @game.name = params[:name]
    @game.genre = params[:genre]
    @game.reason = params[:reason]
    @game.save
    redirect "/games/#{@game.id}"
  end

  delete '/games/:id' do
    authenticate
    @game = Game.find_by(id: params[:id])
    @game.delete
    redirect "/games"
  end

end