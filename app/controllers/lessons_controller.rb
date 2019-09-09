class LessonsController < ApplicationController

    get '/lessons' do 
      if logged_in?
        @teacher = Teacher.find_by_id(session[:user_id])
        @teacher_first_name = @teacher.name.split(" ").first
        @lessons = Lesson.all
        erb :'/lessons/show_all'
      else
        redirect to '/login'
      end
    end

    get '/lessons/new' do

    end

end