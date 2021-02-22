class MedicationsController < ApplicationController
   
    get "/medications" do
        require_login
        user = User.find_by_id(session[:user_id])
        @medications = user.medications
        erb :"/medications/index"                                           
      end

    get "/medications/new" do
      require_login
      @medications = Medication.all
      erb :"/medications/new"
    end

    post "/medications" do        
        @name = params[:name]
        @medication = Medication.find_or_create_by(name: params[:name], description: params[:description], 
        disease_states: params[:disease_state], medications: params[:medication_id], user_id: params[:user_id])
      
    end

    post "/medications" do
      erb :"medications/show"
    end
        # if @medication.create
        #     redirect "/medications"
        # else
        #   @error = "Please list medication."
        #   erb :"/medications/new"
        # end
end