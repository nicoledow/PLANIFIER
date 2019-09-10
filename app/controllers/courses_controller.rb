class CoursesController < ApplicationController
  
  get '/courses' do
    verify_logged_in
    @courses = Course.all
    @current_user = current_user
    erb :'/courses/index'
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


  get '/courses/new' do
    @teacher = current_user
    erb :'/courses/new'
  end


  get '/courses/:id/edit' do
    @course = Course.find_by_id(params["id"])
    erb :'/courses/edit'
  end


#could use an error message here -- if lesson doesn't exist (invalid URL)
  get '/courses/:id' do
    verify_logged_in
    @course = Course.find_by_id(params["id"].to_i)
    @lessons = Lesson.all.select {|lesson| lesson.course_id == @course.id}
    erb :'/courses/show'
  end

  patch '/courses/:id' do
    @course = Course.find_by_id(params["id"])
    @course.update(name: params["name"])
    @course.save
    redirect to "/courses/#{@course.id}"
  end


  delete '/courses/:id' do
    #binding.pry
    Course.find_by_id(params["id"]).destroy
    redirect to '/courses'
  end



end
