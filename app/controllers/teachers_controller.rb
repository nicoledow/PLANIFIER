class TeachersController < ApplicationController

    get '/teachers' do
      verify_logged_in
      @current_user = current_user
      @teachers = Teacher.all
      erb :'/teachers/index'
    end


    get '/teachers/:id' do
      verify_logged_in
      if Teacher.find_by_id(params["id"])
        @teacher = Teacher.find_by_id(params["id"])
        erb :'/teachers/show'
      else
        flash[:taecher_not_found] = "Teacher not found."
        redirect to '/teachers'
      end
    end


end