class MedicationsController < ApplicationController
   
    get "/medications" do
      
        require_login
        user = User.find_by_id(session[:user_id])
        @medications = user.medications
        # @medications = Medication.all
        erb :"/medications/index"   
      end

    get "/medications/new" do
      require_login
      @medications = Medication.all
      erb :"/medications/new"
    end

    post "/medications" do    
        
        @medications = Medication.create(name: params[:name], description: params[:description], 
        disease_states_name: params[:disease_states_name], brand: params[:brand], dose: params[:dose], quantity: params[:quantity],
        medication_id: params[:medication_id])
        @medications.users << User.find_by_id(params[:user_id].to_i)
        redirect "/medications"
    end
end