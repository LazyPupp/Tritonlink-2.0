/*
SELECT DISTINCT Row_Number() OVER(ORDER BY m.meeting_id) AS Row, cm.meeting_id, m.day_of_week, m.start_time INTO meetDk
FROM Class_Meeting cm, MEETING m 
WHERE 42 <> cm.meeting_id AND cm.section_id = 4 AND cm.meeting_id = m.meeting_id;

SELECT * FROM meetDk;
SELECT DISTINCT cm.meeting_id, Row_Number() OVER(ORDER BY m.meeting_id) AS Row_, cc.section_id,tb.name,  m.day_of_week, m.start_time INTO courseA
FROM Class_Meeting cm, MEETING m, Course_Class cc, Taught_By tb 
WHERE cc.section_id <> 20  AND cc.course_id = tb.course_id AND cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id AND tb.name = 'Kelly Clarkson'
AND tb.quarter = 'Winter' AND tb.year_= '2016';

SELECT DISTINCT Row_Number() OVER(ORDER BY m.meeting_id) AS RowA, tb.name, cm.meeting_id, m.day_of_week, m.start_time INTO courseB
FROM Class_Meeting cm, MEETING m, Course_Class cc, Taught_By tb 
WHERE cc.section_id = 20 AND cc.course_id = tb.course_id AND cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id AND tb.name = 'Kelly Clarkson'
AND tb.quarter = 'Winter' AND tb.year_= '2016';*/
/*trigger to insert a particular meeting for Class_Meeting*/
CREATE TRIGGER sections
ON Class_Meeting
AFTER INSERT
AS
BEGIN

	DECLARE @sect integer;
	DECLARE @istart time;
	DECLARE @iDay varchar(255);
	DECLARE @meet integer;
/*	DECLARE @m varchar(255);*/
	DECLARE @inc integer;
	
	SET @sect = (SELECT section_id FROM Inserted);
	SET @meet = (SELECT meeting_id FROM Inserted);
	SET @istart = (SELECT start_time FROM Inserted cm, Meeting m WHERE cm.meeting_id = m.meeting_id);
	SET @iDay = (SELECT day_of_week FROM Inserted cm, Meeting m WHERE cm.meeting_id = m.meeting_id);
	SET @inc = 0;
	
	BEGIN
		SELECT DISTINCT Row_Number() OVER(ORDER BY m.meeting_id) AS Row_, cm.meeting_id, m.day_of_week, m.start_time INTO meetDup
		FROM Class_Meeting cm, MEETING m 
		WHERE cm.meeting_id <> @meet AND cm.section_id = @sect AND cm.meeting_id = m.meeting_id;
	END
		/*SET @m = (SELECT count(*) FROM  meetDup);*/
	BEGIN
		WHILE ( @inc <= (SELECT count(*) FROM  meetDup))
		BEGIN
			IF( (SELECT day_of_week FROM meetDup WHERE row_ = @inc) = @iDay
			AND (SELECT start_time FROM meetDup WHERE row_ = @inc) = @istart)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Meeting %d conflicts',11,11,@meet);

				/*Print'Breaking'*/
				BREAK;
			END
			SET @inc = @inc+1;
			/*Print @m;
			Print 'Dropping row';*/		
		END
	END
	DROP TABLE meetDup;
END

CREATE TRIGGER prof
ON Class_Meeting
AFTER INSERT
AS
BEGIN

	DECLARE @sect integer;
	DECLARE @istart time;
	DECLARE @iDay varchar(255);
	DECLARE @meet integer;
/*	DECLARE @m varchar(255);*/
	DECLARE @inc integer;
	DECLARE @pname varchar(255);
	
	SET @sect = (SELECT section_id FROM Inserted);
	SET @meet = (SELECT meeting_id FROM Inserted);
	SET @istart = (SELECT start_time FROM Inserted cm, Meeting m WHERE cm.meeting_id = m.meeting_id);
	SET @iDay = (SELECT day_of_week FROM Inserted cm, Meeting m WHERE cm.meeting_id = m.meeting_id);
	SET @inc = 0;
	SET @pname = (SELECT DISTINCT name FROM taught_by tb, inserted i, course_class cc WHERE tb.course_id = cc.course_id AND cc.section_id = i.section_id);
	
	BEGIN
		SELECT DISTINCT Row_Number() OVER(ORDER BY m.meeting_id) AS Row_, cm.meeting_id, m.day_of_week, m.start_time INTO profDup
		FROM Class_Meeting cm, MEETING m , Taught_By tb, Course_Class cc
		WHERE cm.meeting_id <> @meet AND tb.name = @pname AND cm.meeting_id = m.meeting_id AND cc.course_id = tb.course_id AND cm.section_id = cc.section_id;
	END
		/*SET @m = (SELECT count(*) FROM  meetDup);*/
	BEGIN
		WHILE ( @inc <= (SELECT count(*) FROM  profDup))
		BEGIN
			IF( (SELECT day_of_week FROM profDup WHERE row_ = @inc) = @iDay
			AND (SELECT start_time FROM profDup WHERE row_ = @inc) = @istart)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Meeting %d conflicts with %s',11,11,@meet,@pname);

				/*Print'Breaking'*/
				BREAK;
			END
			SET @inc = @inc+1;
			/*Print @m;
			Print 'Dropping row';*/		
		END
	END
	DROP TABLE profDup;
END

/*enrollment*/
CREATE TRIGGER enrollments
ON Course_Taken
AFTER INSERT
AS
BEGIN
	DECLARE @section_id integer;

	SET @section_id = (SELECT section_id FROM INSERTED);

	IF( (SELECT count (*) FROM Course_Taken ct WHERE ct.section_id = @section_id) > (SELECT ab.enrollment_limit FROM (SELECT DISTINCT c.section_id, c.enrollment_limit FROM INSERTED ct, Class_ c WHERE ct.section_id = c.section_id AND c.Quarter = 'winter' AND c.year_= 2016)ab))
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('Section %d is full',11,11,@section_id);
	END

END
GO

/*4c*/
CREATE TRIGGER prof
ON Course_Class
AFTER INSERT
AS
BEGIN

	DECLARE @sect integer;
	DECLARE @istart time;
	DECLARE @iDay varchar(255);
	DECLARE @course_id integer;
/*	DECLARE @m varchar(255);*/
	DECLARE @incA integer;
	DECLARE @incB integer;
	DECLARE @pname varchar(255);
	
	SET @sect = (SELECT section_id FROM Inserted);
	SET @course_id = (SELECT course_id FROM Inserted);
	SET @istart = (SELECT start_time FROM Inserted cc, Class_Meeting cm,Meeting m WHERE cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id);
	SET @iDay = (SELECT day_of_week FROM Inserted cc, Class_Meeting cm,Meeting m WHERE cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id);
	SET @incA = 0;
	SET @incB = 0;
	SET @pname = (SELECT tb.name FROM inserted cc, Taught_By tb WHERE tb.course_id = cc.course_id)
	
	BEGIN
	SELECT DISTINCT cm.meeting_id, Row_Number() OVER(ORDER BY m.meeting_id) AS Row_, cc.section_id,tb.name,  m.day_of_week, m.start_time INTO courseA 
	FROM Class_Meeting cm, MEETING m, Course_Class cc, Taught_By tb 
	WHERE cc.section_id <> @sect  AND cc.course_id = tb.course_id AND cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id AND tb.name = @pname
	AND tb.quarter = 'Winter' AND tb.year_= '2016';
	END

	BEGIN
	SELECT DISTINCT Row_Number() OVER(ORDER BY m.meeting_id) AS RowA, tb.name, cm.meeting_id, m.day_of_week, m.start_time INTO courseBb
	FROM Class_Meeting cm, MEETING m, Course_Class cc, Taught_By tb 
	WHERE cc.section_id = @sect AND cc.course_id = tb.course_id AND cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id AND tb.name = @pname
	AND tb.quarter = 'Winter' AND tb.year_= '2016';
	END
		/*SET @m = (SELECT count(*) FROM  meetDup);*/
	BEGIN
		WHILE ( @incA <= (SELECT count(*) FROM  courseA))
		BEGIN
			WHILE (@incB <= (SELECT count(*) FROM  courseBb))
			BEGIN
				IF( (SELECT day_of_week FROM courseA WHERE row_ = @incA) = (SELECT day_of_week FROM courseBb WHERE rowA = @incB)
				AND (SELECT start_time FROM courseA WHERE row_ = @incA) =  (SELECT start_time FROM courseBb WHERE rowA = @incB) )
				BEGIN
					ROLLBACK TRANSACTION
					RAISERROR('Section %d conflicts for prof %s',11,11,@sect,@pname);
					/*Print'Breaking'*/
					BREAK;
				END
				SET @incB = @incB+1;
			END
			SET @incA = @incA+1;
			SET @incB = 0;
			/*Print @m;
			Print 'Dropping row';*/
			
		END
	END

END

CREATE TRIGGER prof2
ON Class_Meeting
AFTER INSERT
AS
BEGIN

	DECLARE @sect integer;
	DECLARE @istart time;
	DECLARE @iDay varchar(255);
	DECLARE @meet integer;
/*	DECLARE @m varchar(255);*/
	DECLARE @inc integer;
	DECLARE @pname varchar(255);
	
	SET @sect = (SELECT section_id FROM Inserted);
	SET @meet = (SELECT meeting_id FROM Inserted);
	SET @istart = (SELECT start_time FROM Inserted cm, Meeting m WHERE cm.meeting_id = m.meeting_id);
	SET @iDay = (SELECT day_of_week FROM Inserted cm, Meeting m WHERE cm.meeting_id = m.meeting_id);
	SET @inc = 0;
	SET @pname = (SELECT distinct tb.name FROM inserted cm, Course_class cc, Taught_By tb WHERE tb.course_id = cc.course_id AND cc.section_id = cm.section_id AND tb.quarter = 'Winter' AND tb.year_= '2016')
	
	BEGIN
SELECT DISTINCT cm.meeting_id, Row_Number() OVER(ORDER BY m.meeting_id) AS RowC, cc.section_id,tb.name,  m.day_of_week, m.start_time INTO courseC
FROM Class_Meeting cm, MEETING m, Course_Class cc, Taught_By tb 
WHERE cm.section_id <> @sect  AND cc.course_id = tb.course_id AND cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id AND tb.name = @pname
AND tb.quarter = 'Winter' AND tb.year_= '2016';
	END
		/*SET @m = (SELECT count(*) FROM  meetDup);*/
	BEGIN
		WHILE ( @inc <= (SELECT count(*) FROM  courseC))
		BEGIN
			IF( (SELECT day_of_week FROM courseC WHERE rowC = 0) = @iDay
			AND (SELECT start_time FROM courseC WHERE rowC = 0) = @istart)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Meeting %d conflicts with',1,1,@meet);

				/*Print'Breaking'*/
				BREAK;
			END
			SET @inc = @inc+1;
			/*Print @m;
			Print 'Dropping row';*/
			
		END
	END

END


CREATE Table profSect(name varchar(255),
					course_id integer,
					section_id integer,
					meeting_id integer,
					quarter varchar(255),
					year_ integer,
					start_time time,
					day_of_week varchar(255));
					
CREATE TRIGGER prof
on Taught_By 
AFTER INSERT
AS
BEGIN
	DECLARE @name varchar(255);
	DECLARE @course_id integer;
	DECLARE @quarter varchar(255);
	DECLARE @year_ integer;
	
	SET @name = (SELECT name FROM Inserted);
	SET @course_id = (SELECT course_id FROM Inserted);
	IF 
insert into profSect (name, course_id, quarter, year_) values (,1,'Fall',2014);
END

CREATE TRIGGER sectMeet
on Taught_By 
AFTER INSERT
AS
BEGIN
	
END



/*	BEGIN
	SELECT DISTINCT cm.meeting_id, Row_Number() OVER(ORDER BY m.meeting_id) AS Row_, cc.section_id,tb.name,  m.day_of_week, m.start_time INTO courseC 
	FROM Class_Meeting cm, MEETING m, Course_Class cc, Taught_By tb 
	WHERE cc.section_id <> @sect  AND cc.course_id = tb.course_id AND cc.section_id = cm.section_id AND cm.meeting_id = m.meeting_id AND tb.name = @pname
	AND tb.quarter = 'Winter' AND tb.year_= '2016';
	END
		/*SET @m = (SELECT count(*) FROM  meetDup);*/
	BEGIN
		WHILE ( @incA <= (SELECT count(*) FROM  courseC))
		BEGIN
			IF( (SELECT day_of_week FROM courseC WHERE rowC = @incA) = @iDay
			AND (SELECT start_time FROM courseC WHERE rowC = @incA) = @istart)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Meeting %d conflicts',1,2,@meet);

				/*Print'Breaking'*/
				BREAK;
			END
			SET @incA = @incA+1;
			/*Print @m;
			Print 'Dropping row';*/
			
		END
	END*/


