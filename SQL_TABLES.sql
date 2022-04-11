//// -- LEVEL 1
//// -- Tables and References

// Creating tables
Table courses  {
  id int [pk, increment] // auto-increment
  course_name varchar
  course_level varchar
  status varchar
  created_at timestamp
  updated_at timestamp
  course_start_date date
  course_end_date date
  certificate_issuedate date
}



Table modules  {
  id int [pk, increment] // auto-increment
  module_name varchar
  course_name varchar
  staff_name varchar
  course_id  int
  status varchar
  module_start_date date
  module_end_date date
  created_at timestamp
  updated_at timestamp
}


Table staffs  {
  id int [pk, increment] // auto-increment
  name varchar
  staff_id varchar
  email varchar
  contact varchar
  usertype varchar
  course_id  int
  status varchar
  created_at timestamp
  updated_at timestamp
}



Table students  {
  id int [pk, increment] // auto-increment
  name varchar
  student_id  varchar
  email varchar
  contact varchar
  date_of_birth varchar
  gender varchar
  fees varchar
  course_id  int
  status varchar
  created_at timestamp
  updated_at timestamp
}



Table students_results  {
  id int [pk, increment] // auto-increment
  name varchar
  student_id  varchar
  course_id  int
  module_id  int
  module_name varchar
  staff_name varchar
  marks int
  status varchar
  created_at timestamp
  updated_at timestamp
}





Table users  {
  id int [pk, increment] // auto-increment
  staff_id varchar
  email varchar
  password varchar
  usertype varchar
  status varchar
  created_at timestamp
  updated_at timestamp
}




Ref: "courses"."id" < "modules"."course_id"


Ref: "courses"."id" < "students_results"."course_id"

Ref: "modules"."id" < "students_results"."module_id"

Ref: "students"."student_id" < "students_results"."student_id"



Ref: "staffs"."staff_id" < "users"."staff_id"
