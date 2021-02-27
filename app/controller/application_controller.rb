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

  get '/users/signup' do
    erb :"/users/signup"
  end

  get '/' do
    require_login 
    erb :"users/login"
  end
  
  post 'medications' do
    require_login 
    erb :"medications/index"
  end

  get '/medications/edit' do
    require_login 
    @medication = Medication.find_by(id: params[:id])
    if @medication = current_user
    'medications/edit'
  end
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