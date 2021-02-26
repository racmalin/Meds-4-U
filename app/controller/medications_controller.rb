class MedicationsController < ApplicationController
   
    get "/medications" do
        require_login
        # binding.pry
       
        @medications = current.user.medications
        erb :"/medications/index"   
    end

    get "/medications/new" do
      require_login
      @medications = Medication.all
      erb :"/medications/new"
    end

    post "/medications" do
        require_login    
        medication = Medication.create(name: params[:name], description: params[:description], 
        disease_states_name: params[:disease_states_name], brand: params[:brand], dose: params[:dose], quantity: params[:quantity],
        medication_id: params[:medication_id])
        if medication.valid?
            medication.users << current_user
            redirect "/medications"
        else 
            flash[:error] = medication.errors.full_messages.to_sentence
            redirect '/medications/new'
        end
    end
    
    private

    get '/medications/:id/edit' do
      require_login 
      @medication = Medication.find_by(id: params[:id])
      if @medication
      erb :"medications/edit"
    end

    patch '/medications/:id' do
        require_login 
        medication = Medication.find_by(id: params[:id])
        medication.update(name: params[:name], description: params[:description], 
        disease_states_name: params[:disease_states_name], brand: params[:brand], dose: params[:dose], quantity: params[:quantity])
        redirect "/medications/#{medication.id}"
    end

    delete '/medications/:id' do
        require_login 
        medication = Medication.find_by(id: params[:id])
        medication.delete
        redirect "/medications"
    end

end