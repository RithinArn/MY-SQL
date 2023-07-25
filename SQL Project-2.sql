# Q1
CREATE SCHEMA alumni;
USE alumni;

# Q2
-- In screen shots

# Q3
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;

# Q4
-- In screen shots

# Q5
-- In screen shots

# Q6
CREATE VIEW college_A_HS_V AS
    (SELECT 
        *
    FROM
        college_a_hs
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND HSDegree IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL); 
SELECT * FROM college_A_HS_V;

# Q7
CREATE VIEW college_A_SE_V AS
    (SELECT 
        *
    FROM
        college_a_se
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL);
SELECT * FROM college_A_SE_V;

# Q8
CREATE VIEW college_A_SJ_V AS
    (SELECT 
        *
    FROM
        college_a_sj
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL);
SELECT * FROM college_A_SJ_V;

# Q9
CREATE VIEW college_B_HS_V AS
    (SELECT 
        *
    FROM
        college_b_hs
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND HSDegree IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL);
SELECT * FROM college_B_HS_V;

# Q10
CREATE VIEW college_B_SE_V AS
    (SELECT 
        *
    FROM
        college_b_se
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL);

# Q11
CREATE VIEW college_B_SJ_V AS
    (SELECT 
        *
    FROM
        college_b_sj
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL);
SELECT * FROM college_B_SJ_V;

# Q12
USE alumni;
SELECT lower(Name),lower(FatherName),lower(MotherName) FROM college_A_HS_V;
SELECT lower(Name),lower(FatherName),lower(MotherName) FROM college_A_SE_V;
SELECT lower(Name),lower(FatherName),lower(MotherName) FROM college_A_SJ_V;
SELECT lower(Name),lower(FatherName),lower(MotherName) FROM college_B_HS_V;
SELECT lower(Name),lower(FatherName),lower(MotherName) FROM college_B_SE_V;
SELECT lower(Name),lower(FatherName),lower(MotherName) FROM college_B_SJ_V;

# Q13
-- In screen shots

# Q14
DELIMITER $$
CREATE PROCEDURE get_name_collegeA ( INOUT name1 TEXT(40000))
BEGIN
DECLARE na INT DEFAULT 0;
DECLARE namelist VARCHAR(16000) DEFAULT " " ;
DECLARE namedetail CURSOR FOR SELECT Name FROM college_a_hs UNION SELECT Name FROM college_a_se UNION SELECT Name FROM college_a_sj;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET na=1;
OPEN namedetail;
getname:
LOOP FETCH FROM namedetail INTO namelist;
IF na=1 THEN
LEAVE getname;
END IF ;
SET name1=CONCAT(namelist, ";" ,name1);
END LOOP getname;
CLOSE namedetail;
END $$
DELIMITER  ;

SET @name1="";
CALL get_name_collegeA(@name1);
SELECT @name1;

# Q15
DELIMITER $$
CREATE PROCEDURE get_name_collegeB ( INOUT name1 TEXT(40000))
BEGIN
DECLARE na INT DEFAULT 0;
DECLARE namelist VARCHAR(16000) DEFAULT " " ;
DECLARE namedetail CURSOR FOR SELECT Name FROM college_b_hs UNION SELECT Name FROM college_b_se UNION SELECT Name FROM college_b_sj;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET na=1;
OPEN namedetail;
getname:
LOOP FETCH FROM namedetail INTO namelist;
IF na=1 THEN
LEAVE getname;
END IF ;
SET name1=CONCAT(namelist, ";" ,name1);
END LOOP getname;
CLOSE namedetail;
END $$
DELIMITER  ;

SET @name1="";
CALL get_name_collegeB(@name1);
SELECT @name1;

# Q16
SELECT 
    'Higher Studies' Present_status,
    (COUNT(college_a_hs.RollNo) / (college_a_hs.RollNo)) * 100 College_A_Percentage,
    (COUNT(college_b_hs.RollNo) / (college_b_hs.RollNo)) * 100 College_B_Percentage
FROM
    college_a_hs
        CROSS JOIN
    college_b_hs 
UNION SELECT 
    'Self Employment' Present_status,
    (COUNT(college_a_se.RollNo) / (college_a_se.RollNo)) * 100 College_A_Percentage,
    (COUNT(college_b_se.RollNo) / (college_b_se.RollNo)) * 100 College_B_Percentage
FROM
    college_a_se
        CROSS JOIN
    college_b_se 
UNION SELECT 
    'Service Job' Present_status,
    (COUNT(college_a_sj.RollNo) / (college_a_sj.RollNo)) * 100 College_A_Percentage,
    (COUNT(college_b_sj.RollNo) / (college_b_sj.RollNo)) * 100 College_B_Percentage
FROM
    college_a_sj
        CROSS JOIN
    college_b_sj; 
