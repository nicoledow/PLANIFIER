mlle = Teacher.new(name: "Nikki Dow", email: "nikki.dow71@gmail.com", username: "n_dow", password: "apple")
senor = Teacher.new(name: "Senor Munoz", email: mmunoz@school.com, username: "m_munoz", password: "apple")
frizzle = Teacher.new(name: "Sarah Frizzle", email: "sfrizzle@school.com", username: "s_frizzle", password: "apple")


french_1 = Course.new(name: "French 1", teacher_id: 1)
spanish_1 = Course.new(name: "Spanish 1", teacher_id: 2)
world_lang = Course.new(name: "World Languages", teacher_id: 1)
science_7 = Course.new(name: "Science 7", teacher_id: 3)

# t.string  "title"
# t.string  "objectives"
# t.string  "content"
# t.string  "assessment"
# t.integer "course_id"

lesson_info = {
  :title => "Languages of the World",
  :objectives => "To learn how many languages there are in the world",
  :content => "1. Have students write a guess for how many languages are in the world. 2. Show students the answer",
  :assessment => "Students pass in an exit ticket",
  :course_id => 3
}
language_intro = Lesson.new(lesson_info)