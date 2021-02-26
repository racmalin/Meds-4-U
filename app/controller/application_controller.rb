require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "mysessionsecretpassword"
    register Sinatra::Flash
  end

  get '/' do
    erb :"users/index"
  end

  
  post 'medications' do
    erb :"medications/index"
  end

  

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect '/login'
    end
   end
  
   def redirect_logged_in
    if logged_in?
      redirect '/medications'
    end
  end
end