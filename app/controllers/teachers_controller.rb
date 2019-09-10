class TeachersController < ApplicationController

    get '/teachers' do
      verify_logged_in
      @teachers = Teacher.all
      erb :'/teachers/index'
    end

#could use error message here in case id or URL is invalid
    get '/teachers/:id' do
      verify_logged_in
      @teacher = Teacher.find_by_id(params["id"])
      erb :'/teachers/show'
    end


end