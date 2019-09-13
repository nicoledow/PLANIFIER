class LessonsController < ApplicationController

  get '/lessons/new' do
    verify_logged_in
    @my_courses = Course.all.select {|course| course.teacher_id == current_user.id}
    erb :'/lessons/new'
  end



   #could use error message here -- if lesson id is invalid/lesson doesn't exist/invalid URL
   get '/lessons/:id' do 
    verify_logged_in
    @lesson = Lesson.find_by_id(params["id"])
    @current_user = current_user
    erb :'/lessons/show'
  end


  get '/lessons/:id/save' do
    SavedLesson.create(saving_teacher_id: current_user.id, saved_lesson_id: params["id"])
    redirect to '/lessons/saved'
  end

    get '/lessons/:id/edit' do
      verify_logged_in
      @lesson = Lesson.find_by_id(params["id"])
      erb :'/lessons/edit'
    end


    patch '/lessons/:id' do
      @lesson = Lesson.find_by_id(params["id"])
      @lesson.update(title: params["title"], objectives: params["objectives"], content: params["content"], assessment: params["assessment"])
      @lesson.save
      redirect to "/lessons/#{@lesson.id}"
    end


    delete '/lessons/:id' do
      @lesson = Lesson.find_by_id(params["id"])
      @lesson.destroy
      redirect to '/lessons'
    end


    get '/lessons/saved' do
      @saved_lessons = SavedLesson.all.select {|sl| sl.saving_teacher_id == current_user.id}
      erb :'/lessons/saved'
    end


    get '/lessons' do 
      verify_logged_in
      @lessons = Lesson.all
      @current_user = current_user
      erb :'/lessons/index'
    end


#could use an error message here
    post '/lessons' do
      @course = Course.find_by_id(params["course"].to_i)
      @lesson = Lesson.new(title: params["title"], objectives: params["objectives"], content: params["content"], assessment: params["assessment"], course_id: @course.id)
      
      if @lesson.save
        redirect to "/lessons/#{@lesson.id}"
      else
        redirect to '/lessons/new'
      end
    end



    get '/mylessons' do
      verify_logged_in
      @me = Teacher.find_by_id(current_user.id)
      erb :'/lessons/my_account'
    end

    

end