create table Student(sid integer not null identity(1,1),
					 firstname varchar(255) not null,
					 middlename varchar(255),
					 lastname varchar(255) not null,
					 ssn char(9) not null unique,
					 residency varchar(255) not null,
					 enrolled bit not null,
					 primary key (sid));
					 
create table Undergraduate(sid integer not null,
						   college varchar(20) not null,
						   primary key (sid),
						   foreign key (sid) references Student(sid));
						   
create table Graduate(sid integer not null,
					  primary key(sid),
					  foreign key (sid) references Student(sid));
					  
create table MS(sid integer not null,
				concentration varchar(255),
				primary key (sid),
				foreign key (sid) references Graduate(sid));
				
create table PhD(sid integer not null,
				 type_ varchar(20) not null,
				 primary key (sid),
				 foreign key (sid) references Graduate(sid));
				 
create table Time_Period(time_id integer not null identity(1,1),
						 start_quarter varchar(10) not null,
						 start_year integer not null,
						 end_quarter varchar(10) not null,
						 end_year integer not null,
						 primary key(time_id),
						 unique(start_quarter, start_year, end_quarter, end_year));
						 
create table Attends(sid integer not null,
					 time_id integer not null,
					 primary key(sid, time_id),
					 foreign key (sid) references Student(sid),
					 foreign key (time_id) references Time_Period(time_id));

create table Probation(sid integer not null,
					   time_id integer not null,
					   primary key(sid, time_id),
					   foreign key (sid) references Student(sid),
					   foreign key (time_id) references Time_Period(time_id));
					  
create table Previous_Degree(degree_id integer not null identity(1,1),
							 degree_type varchar(255) not null,
							 university varchar(255) not null,
							 unique (degree_type, university),
							 primary key(degree_id));
							 
create table Owns_Degree(sid integer not null,
						 degree_id integer not null,
						 primary key (sid, degree_id),
						 foreign key (sid) references Student(sid),
						 foreign key (degree_id) references Previous_Degree(degree_id));
						 
create table Course(course_id integer not null identity(1,1),
					min_units integer not null,
					max_units integer not null,
					grade_options varchar(20) not null,
					lab_work_req bit not null,
					category varchar(255) not null,
					course_name varchar(255) not null unique,
					consent_req bit not null,
					primary key (course_id));
					
create table prereq(course_id integer not null,
					prereq_id integer not null,
					primary key (course_id, prereq_id),
					foreign key (course_id) references Course(course_id),
					foreign key (prereq_id) references Course(course_id),
					check (course_id <> prereq_id));
					
						  
create table Class_(section_id integer not null identity(1,1),
				   enrollment_limit integer not null,
				   quarter varchar(20) not null,
				   year_ integer not null,
				   title varchar(255) not null,
				   primary key (section_id));
				   
create table Course_Taken(id integer not null identity(1,1),
						  sid integer not null,
						  course_id integer not null,
						  section_id integer not null,
						  quarter varchar(20) not null,
						  year_taken integer not null,
						  grade varchar(20) not null,
						  primary key (id),
						  unique(sid, course_id, quarter, year_taken),
						  foreign key (sid) references Student(sid),
						  foreign key (course_id) references Course(course_id),
						  foreign key (section_id) references Class_(section_id));
				   
create table Course_Class(course_id integer not null,
						  section_id integer not null,
						  primary key (course_id, section_id),
						  foreign key (course_id) references Course(course_id),
						  foreign key (section_id) references Class_(section_id));
						  
create table Waitlisted(waitlist_id integer not null identity(1,1),
						sid integer not null,
						section_id integer not null,
						primary key (sid, section_id),
						foreign key (sid) references Student(sid),
						foreign key (section_id) references Class_(section_id));
						
create table Enrolled(sid integer not null,
					  section_id integer not null,
					  grade_options varchar(20) not null,
					  units_taken_for integer not null,
					  primary key (sid, section_id),
					  foreign key (sid) references Student(sid),
					  foreign key (section_id) references Class_(section_id));
					  
create table Meeting(meeting_id integer not null identity(1,1),
					 type_ varchar(255) not null,
					 day_of_week varchar(20) not null,
					 start_time time not null,
					 end_time time not null,
					 room varchar(255) not null,
					 building varchar(255) not null,
					 mandatory bit not null,
					 primary key (meeting_id));
					 
create table Review(meeting_id integer not null,
					date_ date not null,
					primary key(meeting_id, date_),
					foreign key (meeting_id) references Meeting(meeting_id));
					
create table Class_Meeting(section_id integer not null,
						   meeting_id integer not null,
						   primary key (section_id, meeting_id),
						   foreign key (section_id) references Class_(section_id),
						   foreign key (meeting_id) references Meeting(meeting_id));
						   
create table Faculty(name varchar(255) not null,
					 title varchar(255) not null,
					 primary key (name));
					 
create table Taught_By(name varchar(255) not null,
					   section_id integer not null,
					   quarter varchar(20) not null,
					   year_ integer not null,
					   primary key(name, section_id, quarter, year_),
					   foreign key (name) references Faculty(name),
					   foreign key (section_id) references Class_(section_id));
					   
create table Department(department_id integer not null identity(1,1),
						department_name varchar(255) not null unique,
						primary key (department_id));

create table Faculty_Department(name varchar(255) not null,
								department_id integer not null,
								primary key (name, department_id),
								foreign key (name) references Faculty(name),
								foreign key (department_id) references Department(department_id));
								
create table Course_Offered(course_id integer not null,
							department_id integer not null,
							primary key (course_id, department_id),
							foreign key (course_id) references Course(course_id),
							foreign key (department_id) references Department(department_id));
							
create table Belongs_To(sid integer not null,
						department_id integer not null,
						primary key (sid, department_id),
						foreign key (sid) references Graduate(sid),
						foreign key (department_id) references Department(department_id));

create table Degree(degree_id integer not null identity(1,1),
					concentration varchar(255) not null,
					degree_type varchar(255) not null,
					unique(concentration, degree_type),
					primary key (degree_id));
						
create table Major(sid integer not null,
				   degree_id integer not null,
				   primary key (sid, degree_id),
				   foreign key (sid) references Student(sid),
				   foreign key (degree_id) references Degree(degree_id));
				   
create table Minor(sid integer not null,
				   degree_id integer not null,
				   primary key (sid, degree_id),
				   foreign key (sid) references Student(sid),
				   foreign key (degree_id) references Degree(degree_id));
				   
create table Degree_Required(department_id integer not null,
							 degree_id integer not null,
							 category varchar(255) not null,
							 units_completed integer not null,
							 primary key (department_id, degree_id),
							 foreign key (department_id) references Department(department_id),
							 foreign key (degree_id) references Degree(degree_id));
							 
create table Health_Insurance(health_id integer not null identity(1,1),
							  type_ varchar(255) not null,
							  primary key (health_id));							 
							 
create table Insured(sid integer not null,
					 health_id integer not null,
					 primary key(sid),
					 foreign key (sid) references Student(sid),
					 foreign key (health_id) references Health_Insurance(health_id));
					 
create table Thesis_Committee(sid integer not null,
							  name varchar(255) not null,
							  primary key(sid, name),
							  foreign key (sid) references Graduate(sid),
							  foreign key (name) references Faculty(name));
							  
create table Other_Department_Thesis(sid integer not null,
									 name varchar(255) not null,
									 department_id integer not null,
									 primary key(sid, name),
									 foreign key (sid) references PhD(sid),
									 foreign key (name) references Faculty(name),
									 foreign key (department_id) references Department(department_id));
									 
create table Advises(sid integer not null,
					 name varchar(255) not null,
					 primary key(sid, name),
					 foreign key (sid) references Graduate(sid),
					 foreign key (name) references Faculty(name));
					 
create table BachelorsMS(sid integer not null,
						 primary key (sid),
						 foreign key(sid) references Undergraduate(sid),
						 foreign key(sid) references MS(sid));