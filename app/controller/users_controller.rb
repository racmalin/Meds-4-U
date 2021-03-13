class UsersController < ApplicationController

    
  get "/login" do
    redirect_logged_in
    erb :"/users/login"
  end


  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id     
      redirect "/medications"
    else
      flash[:error] = "Username or password is incorrect."
      redirect "/login"  
   
    end
  end 
  
  get "/users/:id" do
    require_login
    user = User.find_by(id: params[:id])
    if user == current_user
      @medications = current_user.disease_states
      erb :"/users/show"
    else
      redirect "/medications"
    end
  end

  get "/users/medications/:id/edit" do
    require_login
    @disease_state = DiseaseState.find_by(medication_id: params[:id], user: current_user)
    if @disease_state 
      erb :"users/disease_state_edit"
    else
      redirect "/users/#{current_user.id}"
    end
  end

  patch '/users/medications/:id' do
    require_login 
    disease_state = DiseaseState.find_by(medication_id: params[:id], user: current_user)
    if disease_state
      if disease_state.update(dose: params[:dose], quantity: params[:quantity])
        redirect "/users/#{current_user.id}"
      else 
        flash[:error] = disease_state.errors.full_messages.to_sentence
        redirect "/users/medications/#{medication.id}/edit"
      end
    else
      flash[:error] = "Unauthorized user!"
      redirect "/users/#{current_user.id}"
    end
end

delete '/medications/:id' do
  require_login 
  disease_state = DiseaseState.find_by(medication_id: params[:id], user: current_user)
  if disease_state
    if disease_state.destroy
      redirect "/users/#{current_user.id}"
    else 
      flash[:error] = disease_state.errors.full_messages.to_sentence
      redirect "/users/#{current_user.id}"
    end
  else
    flash[:error] = "Unauthorized user!"
    redirect "/users/#{current_user.id}"
  end
end



  
  get "/signup" do
    redirect_logged_in
    erb :"/users/signup"
  end
  
  post "/signup" do    
    user = User.new(params)    
    if user.save
      session[:user_id] = user.id     
      redirect "/medications"      
    else 
      flash[:error] = user.errors.full_messages.to_sentence
        redirect '/signup'
    end
  end

  
  get "/logout" do
    session.destroy
    redirect "/login"
    
  end 
end