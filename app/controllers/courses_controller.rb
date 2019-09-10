class CoursesController < ApplicationController
  
  get '/courses' do
    verify_logged_in
    @courses = Course.all
    erb :'/courses/index'
    
  end

  get '/courses/:id' do
    verify_logged_in
    @course = Course.find_by_id(params["id"].to_i)
    @lessons = Lesson.all.select {|lesson| lesson.course_id == @course.id}
    erb :'/courses/show'
  end

end
