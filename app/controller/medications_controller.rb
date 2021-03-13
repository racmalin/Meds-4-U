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
        medication = Medication.new(name: params[:name], description: params[:description], 
        disease_states_name: params[:disease_states_name], brand: params[:brand])
        medication.owner = current_user
        if medication.save
          if !params[:dose].blank?
            DiseaseState.create(dose: params[:dose], quantity: params[:quantity], medication: medication, user: current_user)
            # medication.users << current_user
          end
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
        if medication.owner == current_user
          if medication.update(name: params[:name], description: params[:description], 
            disease_states_name: params[:disease_states_name], brand: params[:brand])
            redirect "/medications/#{medication.id}"
          else 
            flash[:error] = medication.errors.full_messages.to_sentence
            redirect "/medications/#{medication.id}/edit"
          end
        else
          flash[:error] = "Unauthorized user!"
           redirect "/medications/#{medication.id}"
        end
    end

    delete '/medications/:id' do
        require_login 
        medication = Medication.find_by(id: params[:id])
        if medication.owner == current_user
          if medication.destroy
            redirect "/medications"
          else
            flash[:error] = medication.errors.full_messages.to_sentence
            redirect "/medications/#{medication.id}"
          end
          
        else
          flash[:error] = "Unauthorized user!"
          redirect "/medications/#{medication.id}"
            
        end
    end
end
