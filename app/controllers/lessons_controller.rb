class LessonsController < ApplicationController

  get '/lessons/new' do
    verify_logged_in
    @my_courses = Course.all.select {|course| course.teacher_id == current_user.id}
    erb :'/lessons/new'
  end


  get '/lessons/:id/edit' do
    verify_logged_in
    if Lesson.find_by_id(params["id"])
      @lesson = Lesson.find_by_id(params["id"])
      erb :'/lessons/edit'
    else
      flash[:lesson_not_found] = "Lesson not found."
      redirect to '/lessons'
    end
  end


  get '/lessons/:id/save' do
    @lesson = Lesson.find_by_id(params["id"])
    @teacher = Teacher.find_by_id(current_user.id)
    SavedLesson.create(saving_teacher_id: @teacher.id, lesson_id: @lesson.id)
    redirect to "/lessons/#{@lesson.id}"
  end


  get '/lessons/saved' do 
    @current_user = current_user
    @saved_lessons = SavedLesson.all
    erb :'/savedlessons/index'
  end



   get '/lessons/:id' do 
    verify_logged_in
    if Lesson.find_by_id(params["id"])
      @lesson = Lesson.find_by_id(params["id"])
      @current_user = current_user
      erb :'/lessons/show'
    else
      flash[:lesson_not_found] = "Lesson not found."
      redirect to '/lessons'
    end
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




    get '/lessons' do 
      verify_logged_in
      @lessons = Lesson.all
      @current_user = current_user
      erb :'/lessons/index'
    end


    post '/lessons' do
      @course = Course.find_by_id(params["course"].to_i)
      @lesson = Lesson.new(title: params["title"], objectives: params["objectives"], content: params["content"], assessment: params["assessment"], course_id: @course.id)
      
      if @lesson.save
        redirect to "/lessons/#{@lesson.id}"
      else
        redirect to '/lessons/new'
        flash[:general_error] = "An error occurred. Please try again."
      end
    end



    get '/mylessons' do
      verify_logged_in
      @me = Teacher.find_by_id(current_user.id)
      erb :'/lessons/my_account'
    end

    

end