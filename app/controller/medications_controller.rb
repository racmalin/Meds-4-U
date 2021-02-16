class MedicationsController < ApplicationController
   
    get '/medications' do
        @medications = Medication.all
        erb :"medication/index"
    end

    get '/medications/new' do
        erb :"medications/new"
     end

    get '/medications/:id' do
        @medications = Medication.find_by(id: params[:id])
        erb :"medications/show"
    end
    
    post '/medications' do
        medication = Medication.create(name: params["name"], description: params["description"])
        redirect "/medications/#{medication.id}"
    end

    get '/medications/:id/edit' do
        @medication = Medication.find_by(id: params[:id])
        erb :"medications/edit"
    end

    patch '/medications/:id' do
        medication = Medication.find_by(id: params[:id])
        medication.update(title: params["title"], content: params["content"])
        redirect "/medications/#{medication.id}"
    end

    delete '/medications/:id' do
        medication = Medication.find_by(id: params[:id])
        medication.delete
        redirect "/medications"

    end

end