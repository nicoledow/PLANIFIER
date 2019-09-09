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
    erb :login
  end


  get '/signup' do
    erb :signup
  end


  post '/signup' do
    if params["password"] == "" || params["email"] == "" || params["name"] == ""
      redirect to '/signup'
    else
      @teacher = Teacher.create(params)
      @session = session
      @session[:user_id] = @teacher.id
      redirect to '/lessons'
    end
  end


  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end

end
