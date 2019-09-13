class CoursesController < ApplicationController
  
  get '/courses' do
    verify_logged_in
    @courses = Course.all
    @current_user = current_user
    erb :'/courses/index'
  end


  post '/courses' do
    @course = Course.new(name: params["name"], teacher_id: current_user.id)

    if @course.save
      redirect to "/courses/#{@course.id}"
    else
      @course.destroy
      flash[:general_error] = "An error occurred. Please try again."
      redirect to '/courses/new'
    end
  end


  get '/courses/new' do
    verify_logged_in
    @teacher = current_user
    erb :'/courses/new'
  end


  get '/courses/:id/edit' do
    verify_logged_in
    @course = Course.find_by_id(params["id"])
    erb :'/courses/edit'
  end


  get '/courses/:id' do
    verify_logged_in
    if Course.find_by_id(params["id"].to_i)
      @course = Course.find_by_id(params["id"].to_i)
      @lessons = Lesson.all.select {|lesson| lesson.course_id == @course.id}
      erb :'/courses/show'
    else
      flash[:course_not_found] = "Course not found."
      redirect to '/courses'
    end
  end


  patch '/courses/:id' do
    if Course.find_by_id(params["id"])
      @course = Course.find_by_id(params["id"])
      @course.update(name: params["name"])
      @course.save
      redirect to "/courses/#{@course.id}"
    else
      flash[:course_not_found] = "Course not found."
    end
  end


  delete '/courses/:id' do
    Course.find_by_id(params["id"]).destroy
    redirect to '/courses'
  end



end
