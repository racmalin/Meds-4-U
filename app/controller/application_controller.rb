class ApplicationController < Sinatra::Base
    set :views, Proc.new {File.join(root, "../views")}

    get '/' do
        erb :index
    end

    post '/medications' do
        @medication = params["medication"]
        erb :medication
    end

end