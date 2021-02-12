class MedicationsController < ApplicationController
   
    get '/medications' do
        @medications = Medication.all
        erb :"medications/index"
    end

    get '/medications/new' do
        erb :"medications/new"
    end

    post '/medications' do
       @medication = Medication.create(name: params["name"], description: params["description"])
       redirect "/medications"
    end


end