class LessonsController < ApplicationController

    get '/lessons' do 
      @teacher = Teacher.find_by_id(session[:user_id])
      erb :'/lessons/show_all'
    end

end