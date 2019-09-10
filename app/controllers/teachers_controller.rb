class TeachersController < ApplicationController

    get '/teachers/:id' do
      @teacher = Teacher.find_by_id(params["id"])
      erb :'/teachers/show'
    end


end