class TeachersController < ApplicationController

    get '/teachers' do
      verify_logged_in
      @teachers = Teacher.all
      erb :'/teachers/index'
    end


    get '/teachers/:id' do
      verify_logged_in
      @teacher = Teacher.find_by_id(params["id"])
      erb :'/teachers/show'
    end


end