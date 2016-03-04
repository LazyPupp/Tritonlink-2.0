CREATE VIEW student_quarter_grades AS
SELECT s.sid, c.section_id, c.enrollment_limit, c.quarter, c.year_, c.title, ct.units_taken_for, ct.grade, gc.number_grade
FROM Class_ c, Course_Taken ct, Student s, grade_conversion gc
WHERE s.sid = ct.sid AND ct.section_id = c.section_id AND ct.grade = gc.letter_grade;

CREATE VIEW course_taken2 AS 
SELECT ct.*, cc.course_id, c.course_name, c.category, co.department_id, tb.name
FROM Course_Taken ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_;

CREATE VIEW all_deg_info AS
SELECT deg.*, dept.department_name, dr.category, dr.units_completed, dr.min_gpa
FROM Degree deg, Department dept, Degree_Required dr
WHERE deg.degree_id = dr.degree_id AND deg.department_id = dept.department_id;

CREATE VIEW ms_gpa as
SELECT s.sid, c.section_id, c.quarter, c.year_, c.title, ct.units_taken_for, ct.grade, gc.number_grade, co.category
FROM Class_ c, Course_Taken ct, Student s, grade_conversion gc, Course co, Course_class cc
WHERE s.sid = ct.sid AND ct.section_id = c.section_id AND ct.grade = gc.letter_grade AND cc.section_id = ct.section_id AND cc.course_id = co.course_id;

CREATE VIEW course_taken3 AS 
SELECT ct.*, cc.course_id, c.course_name, c.category, co.department_id, tb.name
FROM Course_Taken ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_;