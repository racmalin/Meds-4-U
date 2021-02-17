ENV['SINATRA_ENV'] ||= "development"

require "bundler/setup"
# require "rake"

Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
    set :database, 'sqlite3:db/database.db'
end


ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite3"
)


# require './app/controllers/application_controller'
require_all 'app'