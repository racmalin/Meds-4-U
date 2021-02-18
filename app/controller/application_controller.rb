require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "mysessionsecretpassword"
  end

  get '/' do
    erb :index
  end

  post 'medications' do
    erb :"medications/index"
  end

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def require_login
    unless logged_in?
      redirect '/login'
    end
  end

end