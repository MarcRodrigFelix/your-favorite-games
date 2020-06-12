ENV['SINATRA_APP'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_APP'])

configure :development do
  set :database, {adapter: "sqlite3", database: "db/db.sqlite3"}
end

require_all 'app'