class LessonsController < ApplicationController

    get '/lessons' do 
      verify_logged_in
      @teacher = current_user
      @lessons = Lesson.all
      erb :'/lessons/show_all'
    end


    post '/lessons' do
      @course = Course.find_by_id(params["course"].to_i)

      if @lesson = Lesson.create(title: params["title"], objectives: params["objectives"], content: params["content"], assessment: params["assessment"], course_id: @course.id)
        redirect to "/lessons/#{@lesson.id}"
      else
        redirect to '/lessons/new'
      end
    end


    get '/lessons/new' do
      verify_logged_in
      @my_courses = Course.all.select {|course| course.teacher_id == current_user.id}
      erb :'/lessons/new_lesson'
    end


    get '/lessons/:id' do 
      verify_logged_in
      @lesson = Lesson.find_by_id(params["id"])
      @current_user = current_user
      erb :'/lessons/show'
    end


    get '/mylessons' do
      verify_logged_in
      redirect to "/teachers/#{current_user.id}"
    end

end