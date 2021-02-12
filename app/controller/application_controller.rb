class ApplicationController < Sinatra::Base
    set :views, Proc.new {File.join(root, "../views")}

    get '/' do
        erb :index
    end

    get '/medications' do
        erb :"medications/index"
    end

    
end