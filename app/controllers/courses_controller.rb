class CoursesController < ApplicationController
  
  get '/courses' do
    if logged_in?
      @courses = Course.all
      erb :'/courses/index'
    else
      redirect to '/login'
    end
  end

  get '/courses/:id' do
    @course = Course.find_by_id(params["id"].to_i)
    @lessons = Lesson.all.select {|lesson| lesson.course_id == @course.id}
    erb :'/courses/show'
  end

end
