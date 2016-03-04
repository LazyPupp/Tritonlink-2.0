insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Benjamin', NULL, 'B', 1, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Kristen', NULL, 'W', 2, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Daniel', NULL, 'F', 3, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Claire', NULL, 'J', 4, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Julie', NULL, 'C', 5, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Kevin', NULL, 'L', 6, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Michael', NULL, 'B', 7, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Joseph', NULL, 'J', 8, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Devin', NULL, 'P', 9, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Logan', NULL, 'F', 10, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Vikram', NULL, 'N', 11, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Rachel', NULL, 'Z', 12, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Zach', NULL, 'M', 13, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Justin', NULL, 'H', 14, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Rahul', NULL, 'R', 15, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Dave', NULL, 'C', 16, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Nelson', NULL, 'H', 17, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Andrew', NULL, 'P', 18, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Nathan', NULL, 'S', 19, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('John', NULL, 'H', 20, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Anwell', NULL, 'W', 21, 'California', 1);
insert into Student (firstname, middlename, lastname, ssn, residency, enrolled) values ('Tim', NULL, 'K', 22, 'California', 1);

insert into Graduate (sid) values (16);
insert into Graduate (sid) values (17);
insert into Graduate (sid) values (18);
insert into Graduate (sid) values (19);
insert into Graduate (sid) values (20);
insert into Graduate (sid) values (21);
insert into Graduate (sid) values (22);

insert into MS (sid, concentration) values (16,NULL);
insert into MS (sid, concentration) values (17,NULL);
insert into MS (sid, concentration) values (18,NULL);
insert into MS (sid, concentration) values (19,NULL);
insert into MS (sid, concentration) values (20,NULL);
insert into MS (sid, concentration) values (21,NULL);
insert into MS (sid, concentration) values (22,NULL);
						
insert into Department (department_name) values ('Computer Science');
insert into Department (department_name) values ('Mechanical Engineering');
insert into Department (department_name) values ('Philosophy');
					
insert into Degree (department_id, degree_type, concentration) values (1, 'B.Sc', NULL);
insert into Degree (department_id, degree_type, concentration) values (2, 'B.Sc', NULL);
insert into Degree (department_id, degree_type, concentration) values (3, 'B.A', NULL);
insert into Degree (department_id, degree_type, concentration) values (1, 'M.S', NULL);
insert into Degree (department_id, degree_type, concentration) values (1, 'M.S', 'Databases');
insert into Degree (department_id, degree_type, concentration) values (1, 'M.S', 'AI');
insert into Degree (department_id, degree_type, concentration) values (1, 'M.S', 'Systems');
				   
insert into Major (sid, degree_id) values (1,1);
insert into Major (sid, degree_id) values (2,1);
insert into Major (sid, degree_id) values (3,1);
insert into Major (sid, degree_id) values (4,1);
insert into Major (sid, degree_id) values (5,1);
insert into Major (sid, degree_id) values (6,2);
insert into Major (sid, degree_id) values (7,2);
insert into Major (sid, degree_id) values (8,2);
insert into Major (sid, degree_id) values (9,2);
insert into Major (sid, degree_id) values (10,2);
insert into Major (sid, degree_id) values (11,3);
insert into Major (sid, degree_id) values (12,3);
insert into Major (sid, degree_id) values (13,3);
insert into Major (sid, degree_id) values (14,3);
insert into Major (sid, degree_id) values (15,3);
/*MS*/
insert into Major (sid, degree_id) values (16,4);
insert into Major (sid, degree_id) values (17,4);
insert into Major (sid, degree_id) values (18,4);
insert into Major (sid, degree_id) values (19,4);
insert into Major (sid, degree_id) values (20,4);
insert into Major (sid, degree_id) values (21,4);
insert into Major (sid, degree_id) values (22,4);
					 
insert into Faculty (name, title) values ('Justin Beiber', 'Associate Professor');
insert into Faculty (name, title) values ('Flo Rida', 'Professor');
insert into Faculty (name, title) values ('Selena Gomez', 'Professor');
insert into Faculty (name, title) values ('Adele', 'Professor');
insert into Faculty (name, title) values ('Taylor Swift', 'Professor');
insert into Faculty (name, title) values ('Kelly Clarkson', 'Professor');
insert into Faculty (name, title) values ('Adam Levine', 'Professor');
insert into Faculty (name, title) values ('Bjork', 'Professor');
					

					
					
					

insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Lower Division','CSE 8A',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Upper Division','CSE 105',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Upper Division','CSE 123',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Graduate Division','CSE 250A',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Graduate Division','CSE 250B',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Graduate Division','CSE 255',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'graduate Division','CSE 232A',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'graduate Division','CSE 221',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Lower Division','MAE 3',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Upper Division','MAE 107',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Upper Division','MAE 108',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Lower Division','PHIL 10',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Lower Division','PHIL 12',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Upper Division','PHIL 165',0);
insert into Course (min_units, max_units, grade_options, lab_work_req, category, course_name, consent_req) values (2,4,'Any',0,'Upper Division','PHIL 167',0);
				   

				   
				   
				   
				   
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2014, 'Introduction to Computer Science: Java');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2015, 'Introduction to Computer Science: Java');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2015, 'Introduction to Computer Science: Java');
/*10*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Introduction to Computer Science: Java');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2016, 'Introduction to Computer Science: Java');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter' ,2015, 'Intro to Theory');
/*6*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Intro to Theory');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2016, 'Intro to Theory');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2014, 'Probabilistic Reasoning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2015, 'Probabilistic Reasoning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2016, 'Probabilistic Reasoning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2015, 'Machine Learning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2016, 'Machine Learning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2015, 'Data Mining and Predictive Analytics');
/*3*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Data Mining and Predictive Analytics');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2017, 'Data Mining and Predictive Analytics');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2015, 'Databases');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2016, 'Databases');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2015, 'Operating Systems');
/*2*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Operating Systems');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2016, 'Operating Systems');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2015, 'Computational Methods');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2016, 'Computational Methods');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2014, 'Probability and Statistics');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2015, 'Probability and Statistics');
/*1*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Probability and Statistics');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2016, 'Probability and Statistics');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2015, 'Intro to Logic');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2017, 'Intro to Logic');
/*4*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Scientific Reasoning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2016, 'Scientific Reasoning');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Spring', 2015, 'Freedom, Equality, and the Law');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2015, 'Freedom, Equality, and the Law');
/*7*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Freedom, Equality, and the Law');
insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Fall', 2016, 'Freedom, Equality, and the Law');
/*5*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Operating Systems');
/*9*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Operating Systems');
/*8*/insert into Class_ (enrollment_limit, quarter, year_, title) values (100, 'Winter', 2016, 'Probability and Statistics');


insert into Course_Class (course_id, section_id) values (1,1);
insert into Course_Class (course_id, section_id) values (1,2);
insert into Course_Class (course_id, section_id) values (1,3);
insert into Course_Class (course_id, section_id) values (1,4);
insert into Course_Class (course_id, section_id) values (1,5);
insert into Course_Class (course_id, section_id) values (2,6);
insert into Course_Class (course_id, section_id) values (2,7);
insert into Course_Class (course_id, section_id) values (2,8);
insert into Course_Class (course_id, section_id) values (4,9);
insert into Course_Class (course_id, section_id) values (4,10);
insert into Course_Class (course_id, section_id) values (4,11);
insert into Course_Class (course_id, section_id) values (5,12);
insert into Course_Class (course_id, section_id) values (5,13);
insert into Course_Class (course_id, section_id) values (6,14);
insert into Course_Class (course_id, section_id) values (6,15);
insert into Course_Class (course_id, section_id) values (6,16);
insert into Course_Class (course_id, section_id) values (7,17);
insert into Course_Class (course_id, section_id) values (7,18);
insert into Course_Class (course_id, section_id) values (8,19);
insert into Course_Class (course_id, section_id) values (8,20);
insert into Course_Class (course_id, section_id) values (8,21);
insert into Course_Class (course_id, section_id) values (10,22);
insert into Course_Class (course_id, section_id) values (10,23);
insert into Course_Class (course_id, section_id) values (11,24);
insert into Course_Class (course_id, section_id) values (11,25);
insert into Course_Class (course_id, section_id) values (11,26);
insert into Course_Class (course_id, section_id) values (11,27);
insert into Course_Class (course_id, section_id) values (12,28);
insert into Course_Class (course_id, section_id) values (12,29);
insert into Course_Class (course_id, section_id) values (13,30);
insert into Course_Class (course_id, section_id) values (13,31);
insert into Course_Class (course_id, section_id) values (14,32);
insert into Course_Class (course_id, section_id) values (14,33);
insert into Course_Class (course_id, section_id) values (14,34);
insert into Course_Class (course_id, section_id) values (14,35);
insert into Course_Class (course_id, section_id) values (8,36);
insert into Course_Class (course_id, section_id) values (8,37);
insert into Course_Class (course_id, section_id) values (11,38);
						  
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (1,1,'Fall',2014,4,'Letter','A-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (3,1,'Fall',2014,4,'Letter','B+');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (2,2,'Spring',2015,4,'Letter','C-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (4,3,'Fall',2015,4,'Letter','A-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (5,3,'Fall',2015,4,'Letter','B');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (1,6,'Winter',2015,4,'Letter','A-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (5,6,'Winter',2015,4,'Letter','B+');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (4,6,'Winter',2015,4,'Letter','C');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (16,9,'Fall',2014,4,'Letter','C');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (22,10,'Fall',2015,4,'Letter','B+');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (18,10,'Fall',2015,4,'Letter','D');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (19,10,'Fall',2015,4,'Letter','F');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (17,12,'Winter',2015,4,'Letter','A');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (19,12,'Winter',2015,4,'Letter','A');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (20,14,'Fall',2015,4,'Letter','B-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (18,14,'Fall',2015,4,'Letter','B');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (21,14,'Fall',2015,4,'Letter','F');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (17,17,'Fall',2015,4,'Letter','A-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (22,19,'Spring',2015,4,'Letter','A');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (20,19,'Spring',2015,4,'Letter','A');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (10,22,'Spring',2015,4,'Letter','B+');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (8,24,'Fall',2014,2,'Letter','B-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (7,24,'Fall',2014,2,'Letter','A-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (6,25,'Winter',2015,2,'Letter','B');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (10,25,'Winter',2015,2,'Letter','B+');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (11,28,'Fall',2015,4,'Letter','A');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (12,28,'Fall',2015,4,'Letter','A');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (13,28,'Fall',2015,4,'Letter','C-');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (14,28,'Fall',2015,4,'Letter','C+');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (15,32,'Spring',2015,2,'Letter','F');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (12,32,'Spring',2015,2,'Letter','D');
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (11,33,'Fall',2015,2,'Letter','A-');
/*current*/
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (16,20,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (17,37,'Winter',2016,4,'S/U',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (18,36,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (19,20,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (20,37,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (21,36,'Winter',2016,4,'S/U',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (22,15,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (16,15,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (17,15,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (1,4,'Winter',2016,4,'S/U',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (5,4,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (3,4,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (7,26,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (8,26,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (9,38,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (4,7,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (12,30,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (13,34,'Winter',2016,4,'S/U',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (14,30,'Winter',2016,4,'Letter',NULL);
insert into Course_Taken (sid, section_id, quarter, year_taken, units_taken_for, grade_option, grade) values (15,34,'Winter',2016,4,'Letter',NULL);
							 
/*still need total and tech electives*/
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (1,'Lower Division',10,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (1,'Upper Division',15,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (1,'Tech Elective',15,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (2,'Lower Division',15,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (2,'Upper Division',20,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (2,'Tech Elective',0,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (3,'Lower Division',20,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (3,'Upper Division',20,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (3,'Tech Elective',10,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (4,'Graduate Division',45,NULL);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (5,'Graduate Division',4,3);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (6,'Graduate Division',8,3.1);
insert into Degree_Required (degree_id, category, units_completed, min_gpa) values (7,'Graduate Division',4,3.3);

insert into grade_conversion values('A+', 4.0);
insert into grade_conversion values('A', 4.0);
insert into grade_conversion values('A-', 3.7);
insert into grade_conversion values('B+', 3.3);
insert into grade_conversion values('B', 3.0);
insert into grade_conversion values('B-', 2.7);
insert into grade_conversion values('C+', 2.3);
insert into grade_conversion values('C', 2.0);
insert into grade_conversion values('C-', 1.7);
insert into grade_conversion values('D', 1.0);
insert into grade_conversion values('F', 0.0);
insert into grade_conversion values('S', NULL);
insert into grade_conversion values('U', NULL);

insert into extra_category (course_id, category) values (4,'Tech Elective');
insert into extra_category (course_id, category) values (8,'Tech Elective');
insert into extra_category (course_id, category) values (2,'Tech Elective');
insert into extra_category (course_id, category) values (10,'Tech Elective');
insert into extra_category (course_id, category) values (9,'Tech Elective');
							
insert into Course_Offered (course_id, department_id) values (1,1);
insert into Course_Offered (course_id, department_id) values (2,1);
insert into Course_Offered (course_id, department_id) values (3,1);
insert into Course_Offered (course_id, department_id) values (4,1);
insert into Course_Offered (course_id, department_id) values (5,1);
insert into Course_Offered (course_id, department_id) values (6,1);
insert into Course_Offered (course_id, department_id) values (7,1);
insert into Course_Offered (course_id, department_id) values (8,1);
insert into Course_Offered (course_id, department_id) values (9,2);
insert into Course_Offered (course_id, department_id) values (10,2);
insert into Course_Offered (course_id, department_id) values (11,2);
insert into Course_Offered (course_id, department_id) values (12,3);
insert into Course_Offered (course_id, department_id) values (13,3);
insert into Course_Offered (course_id, department_id) values (14,3);
insert into Course_Offered (course_id, department_id) values (15,3);
					   
insert into Taught_By (name, course_id, quarter, year_) values ('Justin Beiber',1,'Fall',2014);
insert into Taught_By (name, course_id, quarter, year_) values ('Flo Rida',14,'Spring',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Selena Gomez',1,'Fall',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Adele',11,'Fall',2014);
insert into Taught_By (name, course_id, quarter, year_) values ('Taylor Swift',2,'Winter',2016);
insert into Taught_By (name, course_id, quarter, year_) values ('Kelly Clarkson',1,'Spring',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Bjork',4,'Fall',2014);
insert into Taught_By (name, course_id, quarter, year_) values ('Bjork',12,'Fall',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Justin Beiber',5,'Winter',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Flo Rida',6,'Fall',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Selena Gomez',11,'Winter',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Adele',1,'Winter',2016);
insert into Taught_By (name, course_id, quarter, year_) values ('Taylor Swift',2,'Winter',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Kelly Clarkson',7,'Fall',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Adam Levine',14,'Fall',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Bjork',10,'Spring',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Justin Beiber',6,'Winter',2016);
insert into Taught_By (name, course_id, quarter, year_) values ('Selena Gomez',11,'Winter',2016);
insert into Taught_By (name, course_id, quarter, year_) values ('Adam Levine',13,'Winter',2016);
insert into Taught_By (name, course_id, quarter, year_) values ('Bjork',4,'Fall',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Taylor Swift',14,'Winter',2016);
insert into Taught_By (name, course_id, quarter, year_) values ('Kelly Clarkson',8,'Spring',2015);
insert into Taught_By (name, course_id, quarter, year_) values ('Kelly Clarkson',8,'Winter',2016);

insert into concentration (course_id, concentration_name, min_gpa, units) values (7,'Databases',3,4);
insert into concentration (course_id, concentration_name, min_gpa, units) values (4,'AI',3.1,8);
insert into concentration (course_id, concentration_name, min_gpa, units) values (6,'AI',3.1,8);
insert into concentration (course_id, concentration_name, min_gpa, units) values (8,'Systems',3.3,4);

/*1 MAE108*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Monday','10:00','11:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Wednesday','10:00','11:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Friday','10:00','11:00','109','Center',1);
/*2 CSE221*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Monday','10:00','11:00','214','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Wednesday','10:00','11:00','214','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Friday','10:00','11:00','214','Center',1);
/*3 CSE255*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Monday','12:00','13:00','214','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Wednesday','12:00','13:00','214','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Friday','12:00','13:00','214','Center',1);
/*4 PHIL12*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Monday','12:00','13:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Wednesday','12:00','13:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Friday','12:00','13:00','109','Center',1);
/*5 CSE221*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Monday','12:00','13:00','101','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Wednesday','12:00','13:00','101','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Friday','12:00','13:00','101','Center',1);
/*6 CSE105*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Tuesday','14:00','15:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Thursday','14:00','15:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Discussion','Friday','18:00','19:00','109','Center',1);
/*7 PHIL 165*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Tuesday','15:00','16:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Thursday','15:00','16:00','109','Center',1);
/*8 MAE108*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Tuesday','15:00','16:00','101','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Thursday','15:00','16:00','101','Center',1);
/*9 CSE221*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Tuesday','17:00','18:00','109','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Thursday','17:00','18:00','109','Center',1);
/*10 CSE8A*/
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Tuesday','17:00','18:00','101','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Lecture','Thursday','17:00','18:00','101','Center',1);
insert into Meeting(type_, day_of_week, start_time,end_time,room,building, mandatory) values('Discussion','Wednesday','19:00','20:00','109','Center',1);

insert into Class_Meeting(section_id, meeting_id) values (26,1);
insert into Class_Meeting(section_id, meeting_id) values (26,2);
insert into Class_Meeting(section_id, meeting_id) values (26,3);
insert into Class_Meeting(section_id, meeting_id) values (20,4);
insert into Class_Meeting(section_id, meeting_id) values (20,5);
insert into Class_Meeting(section_id, meeting_id) values (20,6);
insert into Class_Meeting(section_id, meeting_id) values (15,7);
insert into Class_Meeting(section_id, meeting_id) values (15,8);
insert into Class_Meeting(section_id, meeting_id) values (15,9);
insert into Class_Meeting(section_id, meeting_id) values (30,10);
insert into Class_Meeting(section_id, meeting_id) values (30,11);
insert into Class_Meeting(section_id, meeting_id) values (30,12);
insert into Class_Meeting(section_id, meeting_id) values (36,13);
insert into Class_Meeting(section_id, meeting_id) values (36,14);
insert into Class_Meeting(section_id, meeting_id) values (36,15);
insert into Class_Meeting(section_id, meeting_id) values (7,16);
insert into Class_Meeting(section_id, meeting_id) values (7,17);
insert into Class_Meeting(section_id, meeting_id) values (7,18);
insert into Class_Meeting(section_id, meeting_id) values (34,19);
insert into Class_Meeting(section_id, meeting_id) values (34,20);
insert into Class_Meeting(section_id, meeting_id) values (38,21);
insert into Class_Meeting(section_id, meeting_id) values (38,22);
insert into Class_Meeting(section_id, meeting_id) values (37,23);
insert into Class_Meeting(section_id, meeting_id) values (37,24);
insert into Class_Meeting(section_id, meeting_id) values (4,25);
insert into Class_Meeting(section_id, meeting_id) values (4,26);
insert into Class_Meeting(section_id, meeting_id) values (4,27);



insert into review_time(id,start_time) values (1,'8:00');
insert into review_time(id,start_time) values (2,'9:00');
insert into review_time(id,start_time) values (3,'10:00');
insert into review_time(id,start_time) values (4,'11:00');
insert into review_time(id,start_time) values (5,'12:00');
insert into review_time(id,start_time) values (6,'13:00');
insert into review_time(id,start_time) values (7,'14:00');
insert into review_time(id,start_time) values (8,'15:00');
insert into review_time(id,start_time) values (9,'16:00');
insert into review_time(id,start_time) values (10,'17:00');
insert into review_time(id,start_time) values (11,'18:00');
insert into review_time(id,start_time) values (12,'19:00');		

/*1 MAE108*/
insert into meeting2b values (1,26,'Lecture',null,3,null,3,null,3,null);	
/*2 CSE221*/
insert into meeting2b values (2,20,'Lecture',null,3,null,3,null,3,null);	
/*3 CSE255*/
insert into meeting2b values (3,15,'Lecture',null,5,null,5,null,5,null);	
/*4 PHIL12*/
insert into meeting2b values (4,30,'Lecture',null,5,null,5,null,5,null);			   
/*5 CSE221*/
insert into meeting2b values (5,36,'Lecture',null,5,null,5,null,5,null);	
/*6 CSE105*/
insert into meeting2b values (6,7'Lecture',null,null,7,null,7,null,null);	
insert into meeting2b values (7,7'Discussion',null,null,null,null,null,11,null);	
/*7 PHIL165*/
insert into meeting2b values (8,34,'Lecture',null,null,8,null,8,null,null);	
/*8 MAE108*/
insert into meeting2b values (9,38,'Lecture',null,null,8,null,8,null,null);	
/*9 CSE221*/
insert into meeting2b values (10,37,'Lecture',null,null,10,null,10,null,null);	
/*10 CSE8A*/
insert into meeting2b values (11,4,'Lecture',null,null,10,null,10,null,null);
insert into meeting2b values (12,4,'Discussion',null,null,null,12,null,null,null);

