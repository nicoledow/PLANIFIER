class TeachersController < ApplicationController

    get '/teachers' do
      if logged_in?
        erb :'/teachers/index'
      else
        redirect to '/login'
      end
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