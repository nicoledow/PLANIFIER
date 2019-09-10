class LessonsController < ApplicationController

  get '/lessons/new' do
    #binding.pry
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


    get '/lessons' do 
      verify_logged_in
      @teacher = current_user
      @lessons = Lesson.all
      erb :'/lessons/show_all'
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
      redirect to "/teachers/#{current_user.id}"
    end

end