class UsersController < ApplicationController

    
  get "/login" do
    erb :"/users/index"
  end

  post "/login" do
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id     
      redirect "/workouts"
    else 
      @error = "Username or password is incorrect."
      erb :"/users/index"
    end     
  end

  
  get "/signup" do
    erb :"/users/signup"
  end

  
  post "/signup" do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id     
      redirect "/workouts"      
    else 
      @error = "Invalid or username already in use."
      erb :"/users/signup"
    end
  end

  
  get "/logout" do
    session.destroy
    redirect "/"
  end 
end