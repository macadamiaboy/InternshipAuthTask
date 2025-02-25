# README

Test task to Rails Backend Internship.
To run the code type "docker compose up" in the command line.

DB has:

Two schools (class School):
* id: 1
* id: 2

Three classes (class Schoolclass):
* id: 1, letter: 'А', number: 7, students_count: 19, school_id: 1
* id: 2, letter: 'Б', number: 8, students_count: 21, school_id: 1
* id: 3, letter: 'В', number: 9, students_count: 23, school_id: 2

Three students (class Student):
* id: 1, first_name: 'Павел', last_name: 'Сергеевич', surname: 'Тетюхин', school_id: 1, schoolclass_id: 1
* id: 2, first_name: 'Алина', last_name: 'Вячеславовна', surname: 'Пязок', school_id: 1, schoolclass_id: 1
* id: 3, first_name: 'Александр', last_name: 'Павлович', surname: 'Шилоносов', school_id: 2, schoolclass_id: 3

All requests are carrying out in accordance with the technical specifications, given in the task.
You should take into account that due to rails features it wasn't possible to name class Class, so it was renamed Schoolclass.
That's why two GET request routes are /schools/[school_id]/schoolclasses and /schools/[school_id]/schoolclasses/[schoolclass_id]/students.

.env file was added to github and removed from .gitignore due to requirement to start the app with docker compose up
