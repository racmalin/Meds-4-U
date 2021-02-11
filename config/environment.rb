ENV['SINATRA_ENV'] ||= 'development'

require "bundler/setup"
require "rake"

Bundler.require(:default, ENV['SINATRA_ENV'])

require_all 'app'

ActiveRecord::Base.establish_connection({
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
})