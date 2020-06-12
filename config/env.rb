ENV['SINATRA_APP'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_APP'])

if ENV['SINATRA_APP'] == 'development'
  require_relative '../secrets'
end

configure :development do
  set :database, {adapter: "sqlite3", database: "db/db.sqlite3"}
end

require_all 'app'