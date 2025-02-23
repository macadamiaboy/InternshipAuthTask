# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#check if schools do already exist and create if not
unless School.exists?
  #1st school
  School.create

  #2nd school
  School.create
end

#same with classes
unless Schoolclass.exists?
  #1st class
  Schoolclass.create(letter: 'А', number: 7, students_count: 19, school_id: 1)

  #2nd class
  Schoolclass.create(letter: 'Б', number: 8, students_count: 21, school_id: 1)

  #3rd class
  Schoolclass.create(letter: 'В', number: 9, students_count: 23, school_id: 2)
end

#and students
unless Student.exists?
  #1st student
  Student.create(first_name: 'Павел', last_name: 'Сергеевич', surname: 'Тетюхин', school_id: 1, schoolclass_id: 1)

  #2nd student
  Student.create(first_name: 'Алина', last_name: 'Вячеславовна', surname: 'Пязок', school_id: 1, schoolclass_id: 1)

  #3rd student
  Student.create(first_name: 'Александр', last_name: 'Павлович', surname: 'Шилоносов', school_id: 2, schoolclass_id: 3)
end