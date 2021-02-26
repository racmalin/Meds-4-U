class UsersController < ApplicationController

    
  get "/login" do
    erb :"/users/index"
  end


  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id     
      redirect "/medications"
    else
      @error = "Username or password is incorrect."
      erb :"/users/signup"  
    # else
    #   @error = "Username or password not found, please sign up."
    #   redirect "/users/signup"
    end
  end 
  
  


  
  get "/signup" do
    erb :"/users/signup"
  end
  
  post "/signup" do    
    @user = User.new(params)    
    if @user.save
      session[:user_id] = @user.id     
      redirect "/medications"      
    else 
      @error = "Invalid or username already in use."
      erb :"/users/signup"
    end
  end

  
  get "/logout" do
    session.destroy
    redirect 
    erb :"users/logout"
  end 
end