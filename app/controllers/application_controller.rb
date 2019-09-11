require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "abcdef"
  end


  get '/' do
    if logged_in?
      redirect to '/lessons'
    else 
      erb :welcome
    end
  end


  get '/logout' do
    verify_logged_in
    session.clear
    redirect to '/'
  end


  get '/login' do
    if logged_in?
      redirect to '/lessons'
    else 
      erb :login
    end
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
    if !logged_in?
      erb :signup
    else
      redirect to '/lessons'
    end
  end

  
#could use an error message here
  post '/signup' do
    #presence & uniqueness of email, password done via ActiveRecord in model
    if params["password"] == "" || params["email"] == "" || params["name"] == ""
      redirect to '/signup'
    else
      @teacher = Teacher.new(params)
      if @teacher.save
        @session = session
        @session[:user_id] = @teacher.id
        redirect to '/lessons'
      else
        redirect to '/signup'
      end
    end
  end

  





  helpers do
    def logged_in?
      !!session[:user_id]
    end

#could use an error message here
    def verify_logged_in
      if !session[:user_id]
        redirect to '/login'
      end
    end


    def current_user
      Teacher.find_by_id(session[:user_id])
    end
  end




end
