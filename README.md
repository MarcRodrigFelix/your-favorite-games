# your-favorite-games

## Description

Your Favorite Games, was created to make a list of your all time favorite games. (Possibly share your list with others in the future.)

## What is Your Favorite Games.
  * Can save users with signup.
  * Has login/logout features.
  
### You can create a brand new list of your favorite games here.
  * Include a Title. 
  * Include a Genre(sometimes we don't agree with publishers, so you can user your own).
  * Reason why it belongs in your list.
  
### You can also.
  * Add a new game.
  * Edit any game on your list. 
  * Delete any game off your list.
  
## Installation.
You can download this repo and try it out locally. Clone the repo and run

      $ bundle install

Load schema if needed

      $ rake db:schema:load

You can test out users if you dont want to create one, look at db/seeds.rb for the examples and run

      $ rake db:seed

Run your local server with 

      $ shotgun or bundle exec shotgun
      $ view local server in browser with (localhost:9393) or use port that console shows

If you want test out the models 

      $ rake console or bundle exec rake console

## Gems Used.
  * Sinatra, "~> 2.0"
  * Activerecord, "~> 6.0"
  * Sinatra-activerecord, "~> 2.0"
  * Pry, "~> 0.13.1"
  * Rake, "~> 13.0"
  * Tux, "~> 0.3.0"
  * SQlite3, "~> 1.4"
  * Shotgun, "~> 0.9.2"
  * Rack, "~> 2.2"
  * Require_all, "~> 3.0"
  * bcrypt, "~> 3.1"
  * Activesupport
  
 ## Future Improvements
  * Add feature where users can look at other users list.
  * Add feature where users can rate other users list.
  * Add feature where users can comment on other users list, or like their list.
  * Touch up some HTML, CSS.
