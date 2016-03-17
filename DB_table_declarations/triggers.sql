SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER cpqg2InsertTrigger 
   ON  course_taken
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @quarter varchar(255);
	DECLARE @year_taken integer;
	DECLARE @grade varchar(255);
	DECLARE @professor varchar(255);
	DECLARE @course_name varchar(255);

	SET @quarter = (SELECT quarter FROM INSERTED);
	SET @year_taken = (SELECT year_taken FROM INSERTED);
	SET @grade = (SELECT grade FROM INSERTED);
	SET @course_name = (SELECT c.course_name
						FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
						WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);
	SET @professor = (SELECT tb.name
					  FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
					  WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);

	if (EXISTS (SELECT course_name, professor, quarter, year_ FROM cpqg2 WHERE course_name = @course_name AND professor = @professor AND quarter = @quarter AND year_ = @year_taken))
		BEGIN
			if(@grade LIKE 'A%')
				BEGIN
					UPDATE cpqg2
					SET a_grade = a_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@grade LIKE 'B%')
				BEGIN
					UPDATE cpqg2
					SET b_grade = b_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@grade LIKE 'C%')
				BEGIN
					UPDATE cpqg2
					SET c_grade = c_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@grade LIKE 'D%')
				BEGIN
					UPDATE cpqg2
					SET d_grade = d_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else
				BEGIN
					UPDATE cpqg2
					SET other_grade = other_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
		END

	else
		BEGIN
			if(@grade LIKE 'A%')
				BEGIN
					INSERT INTO cpqg2(course_name, quarter, year_, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @quarter, @year_taken, @professor, 1, 0, 0 ,0 ,0);
				END
			else if(@grade LIKE 'B%')
				BEGIN
					INSERT INTO cpqg2(course_name, quarter, year_, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @quarter, @year_taken, @professor, 0, 1, 0 ,0 ,0);
				END
			else if(@grade LIKE 'C%')
				BEGIN
					INSERT INTO cpqg2(course_name, quarter, year_, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @quarter, @year_taken, @professor, 0, 0, 1 ,0 ,0);
				END
			else if(@grade LIKE 'D%')
				BEGIN
					INSERT INTO cpqg2(course_name, quarter, year_, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @quarter, @year_taken, @professor, 0, 0, 0 ,1 ,0);
				END
			else
				BEGIN
					INSERT INTO cpqg2(course_name, quarter, year_, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @quarter, @year_taken, @professor, 0, 0, 0 ,0 ,1);
				END
		END
	

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER cpqg2UpdateTrigger 
   ON  course_taken
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @quarter varchar(255);
	DECLARE @year_taken integer;
	DECLARE @oldGrade varchar(255);
	DECLARE @newGrade varchar(255);
	DECLARE @professor varchar(255);
	DECLARE @course_name varchar(255);

	SET @quarter = (SELECT quarter FROM INSERTED);
	SET @year_taken = (SELECT year_taken FROM INSERTED);
	SET @oldGrade = (SELECT grade FROM DELETED);
	SET @newGrade = (SELECT grade FROM INSERTED);
	SET @course_name = (SELECT c.course_name
						FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
						WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);
	SET @professor = (SELECT tb.name
					  FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
					  WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);

		BEGIN
			if(@oldGrade LIKE 'A%')
				BEGIN
					UPDATE cpqg2
					SET a_grade = a_grade - 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@oldGrade LIKE 'B%')
				BEGIN
					UPDATE cpqg2
					SET b_grade = b_grade - 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@oldGrade LIKE 'C%')
				BEGIN
					UPDATE cpqg2
					SET c_grade = c_grade - 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@oldGrade LIKE 'D%')
				BEGIN
					UPDATE cpqg2
					SET d_grade = d_grade - 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else
				BEGIN
					UPDATE cpqg2
					SET other_grade = other_grade - 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
		END

		BEGIN
			if(@newGrade LIKE 'A%')
				BEGIN
					UPDATE cpqg2
					SET a_grade = a_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@newGrade LIKE 'B%')
				BEGIN
					UPDATE cpqg2
					SET b_grade = b_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@newGrade LIKE 'C%')
				BEGIN
					UPDATE cpqg2
					SET c_grade = c_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else if(@newGrade LIKE 'D%')
				BEGIN
					UPDATE cpqg2
					SET d_grade = d_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
			else
				BEGIN
					UPDATE cpqg2
					SET other_grade = other_grade + 1
					WHERE course_name = @course_name AND quarter = @quarter AND year_ = @year_taken AND professor = @professor;
				END
		END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER cpg2InsertTrigger 
   ON  course_taken
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @grade varchar(255);
	DECLARE @professor varchar(255);
	DECLARE @course_name varchar(255);

	SET @grade = (SELECT grade FROM INSERTED);
	SET @course_name = (SELECT c.course_name
						FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
						WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);
	SET @professor = (SELECT tb.name
					  FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
					  WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);

	if (EXISTS (SELECT course_name, professor FROM cpg2 WHERE course_name = @course_name AND professor = @professor))
		BEGIN
			if(@grade LIKE 'A%')
				BEGIN
					UPDATE cpg2
					SET a_grade = a_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@grade LIKE 'B%')
				BEGIN
					UPDATE cpg2
					SET b_grade = b_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@grade LIKE 'C%')
				BEGIN
					UPDATE cpg2
					SET c_grade = c_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@grade LIKE 'D%')
				BEGIN
					UPDATE cpg2
					SET d_grade = d_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else
				BEGIN
					UPDATE cpg2
					SET other_grade = other_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
		END

	else
		BEGIN
			if(@grade LIKE 'A%')
				BEGIN
					INSERT INTO cpg2(course_name, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @professor, 1, 0, 0 ,0 ,0);
				END
			else if(@grade LIKE 'B%')
				BEGIN
					INSERT INTO cpg2(course_name, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @professor, 0, 1, 0 ,0 ,0);
				END
			else if(@grade LIKE 'C%')
				BEGIN
					INSERT INTO cpg2(course_name, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @professor, 0, 0, 1 ,0 ,0);
				END
			else if(@grade LIKE 'D%')
				BEGIN
					INSERT INTO cpg2(course_name, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @professor, 0, 0, 0 ,1 ,0);
				END
			else
				BEGIN
					INSERT INTO cpg2(course_name, professor, a_grade, b_grade, c_grade, d_grade, other_grade) values (@course_name, @professor, 0, 0, 0 ,0 ,1);
				END
		END
	

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER cpg2UpdateTrigger 
   ON  course_taken
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @oldGrade varchar(255);
	DECLARE @newGrade varchar(255);
	DECLARE @professor varchar(255);
	DECLARE @course_name varchar(255);

	SET @oldGrade = (SELECT grade FROM DELETED);
	SET @newGrade = (SELECT grade FROM INSERTED);
	SET @course_name = (SELECT c.course_name
						FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
						WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);
	SET @professor = (SELECT tb.name
					  FROM INSERTED ct, Course_Class cc, Course c, Course_Offered co, Taught_By tb
					  WHERE ct.section_id = cc.section_id AND cc.course_id = c.course_id AND c.course_id = co.course_id AND c.course_id  = tb.course_id AND ct.quarter = tb.quarter and ct.year_taken = tb.year_);

		BEGIN
			if(@oldGrade LIKE 'A%')
				BEGIN
					UPDATE cpg2
					SET a_grade = a_grade - 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@oldGrade LIKE 'B%')
				BEGIN
					UPDATE cpg2
					SET b_grade = b_grade - 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@oldGrade LIKE 'C%')
				BEGIN
					UPDATE cpg2
					SET c_grade = c_grade - 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@oldGrade LIKE 'D%')
				BEGIN
					UPDATE cpg2
					SET d_grade = d_grade - 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else
				BEGIN
					UPDATE cpg2
					SET other_grade = other_grade - 1
					WHERE course_name = @course_name AND professor = @professor;
				END
		END

		BEGIN
			if(@newGrade LIKE 'A%')
				BEGIN
					UPDATE cpg2
					SET a_grade = a_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@newGrade LIKE 'B%')
				BEGIN
					UPDATE cpg2
					SET b_grade = b_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@newGrade LIKE 'C%')
				BEGIN
					UPDATE cpg2
					SET c_grade = c_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else if(@newGrade LIKE 'D%')
				BEGIN
					UPDATE cpg2
					SET d_grade = d_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
			else
				BEGIN
					UPDATE cpg2
					SET other_grade = other_grade + 1
					WHERE course_name = @course_name AND professor = @professor;
				END
		END
END
GO