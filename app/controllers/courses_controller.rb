class CoursesController < ApplicationController
  
  get '/courses' do
    verify_logged_in
    @courses = Course.all
    erb :'/courses/index'
  end


  get '/courses/new' do
    @teacher = current_user
    erb :'/courses/new'
  end

#could use an error message here
  post '/courses' do
    @course = Course.new(name: params["name"], teacher_id: current_user.id)

    if @course.save
      redirect to "/courses/#{@course.id}"
    else
      @course.destroy
      redirect to '/courses/new'
    end
  end


#could use an error message here -- if lesson doesn't exist (invalid URL)
  get '/courses/:id' do
    verify_logged_in
    @course = Course.find_by_id(params["id"].to_i)
    @lessons = Lesson.all.select {|lesson| lesson.course_id == @course.id}
    erb :'/courses/show'
  end



end
