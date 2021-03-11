class MedicationsController < ApplicationController
   
    get "/medications" do
        require_login
        @medications = current_user.medications
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
        )
        medication.owner = current_user
        if medication.valid?
            medication.users << current_user
            redirect "/medications"
        else 
            flash[:error] = medication.errors.full_messages.to_sentence
            redirect '/medications/new'
        end
    end

    get "/medications/:id" do
        require_login
        @medication = Medication.find_by(id: params[:id])
        if @medication
          erb :"/medications/show"
        else
          redirect '/medications'
        end
    end
    
    

    get '/medications/:id/edit' do
      require_login 
      @medication = Medication.find_by(id: params[:id])
      if @medication.owner == current_user
        erb :"/medications/edit"
      else
        flash[:error] = "Unauthorized user!"
          erb :"/medications/show"
      end
    end

    patch '/medications/:id' do
        require_login 
        medication = Medication.find_by(id: params[:id])
        if @medication.owner == current_user
          erb :"/medications/edit"
        else
          flash[:error] = "Unauthorized user!"
            erb :"/medications/show"
        end
        medication.update(dose: params[:dose], quantity: params[:quantity])
        redirect "/medications/#{medication.id}"
    end

    delete '/medications/:id' do
        require_login 
        @medication = Medication.find_by(id: params[:id])
        if @medication.owner == current_user
          erb :"/medications/edit"
        else
          flash[:error] = "Unauthorized user!"
            erb :"/medications/show"
        end
        @medication.delete
        redirect "/medications"
    end
end
