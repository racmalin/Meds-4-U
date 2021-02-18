class DiseaseStatesController < ApplicationController

    get '/disease_states' do
        erb :"/disease_states/index"
    end

end