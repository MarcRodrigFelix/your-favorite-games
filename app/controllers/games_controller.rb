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
    authenticate
    current_game
    erb :'games/show'
  end

  get '/games/:id/edit' do
    authenticate
    current_game
    erb :'games/edit'
  end

  patch '/games/:id' do
    current_game
    params[:new_name] == "" ? @game.name : @game.name = params[:new_name]
    params[:new_genre] == "" ? @game.genre : @game.genre = params[:new_genre]
    params[:new_reason] == "" ? @game.reason : @game.reason = params[:new_reason]
    @game.save
    redirect "/games/#{@game.id}"
  end

  get '/games/:id/delete' do
    current_game
    erb :'games/delete'
  end
  
  delete '/games/:id' do
    authenticate
    current_game.delete
    redirect "/games"
  end

end