class LessonsController < ApplicationController

    get '/lessons' do 
      @teacher = Teacher.find_by_id(session[:user_id])
      @teacher_first_name = @teacher.name.split(" ").first
      erb :'/lessons/show_all'
    end

end