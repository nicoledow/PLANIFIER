class CoursesController < ApplicationController
  
  get '/courses' do
    erb :'/courses/index'
  end

end
