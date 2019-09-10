class TeachersController < ApplicationController

    get '/teachers' do
   
    end


    get '/teachers/:id' do
      if logged_in?
        @teacher = Teacher.find_by_id(params["id"])
        erb :'/teachers/show'
      else
        redirect to '/login'
      end
    end


end