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
        params[:name].delete_if{|m| m == " "}
        @name = params[:name]
        @medication = Medication.find_or_create_by(name: params[:description], user_id: session[:user_id])
        params[:medication_ids].each do |m|
          @medications.disease_states << Disease_State.find(m.to_i)
    end
    end
        # if @medication.create
        #     redirect "/medications"
        # else
        #   @error = "Please list medication."
        #   erb :"/medications/new"
        # end
end