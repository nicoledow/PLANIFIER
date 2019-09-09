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


  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/login'
    end
  end


  get '/login' do 
    erb :login
  end


  post '/login' do
    @teacher = Teacher.find_by(email: params["email"])
    if !!@teacher && @teacher.authenticate(params["password"])
      session[:user_id] = @teacher.id
      redirect to '/lessons'
    else
      redirect to '/signup'
    end
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
      !!session[:user_id]
    end

    def current_user
      Teacher.find(session[:user_id])
    end
  end

end
