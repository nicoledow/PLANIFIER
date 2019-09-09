require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "abcdef"
  end

  get '/' do
    erb :welcome
  end

  get '/login' do 

  end

  get '/signup' do
  
  end

end
