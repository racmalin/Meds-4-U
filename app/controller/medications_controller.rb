class MedicationsController < ApplicationController
    post '/medications' do
        @medication = params["medication"]
        erb :index
    end


end