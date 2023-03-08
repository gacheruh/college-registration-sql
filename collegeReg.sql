DROP TABLE student;
CREATE TABLE student(
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    year_of_study INT
);
--To ensure only 1st - 4th years students are eligible for  registration for the semester
ALTER TABLE student ADD CONSTRAINT chk_course_year CHECK (year_of_study BETWEEN 1 AND 4);

INSERT INTO student (student_id, name, year_of_study)
VALUES 
  ('STU-1', 'John Doe', 1),
  ('STU-2', 'Jane Smith', 2),
  ('STU-3', 'Ligma Johnson', 3),
  ('STU-4', 'Glen Kinyua', 4),
  ('STU-5', 'Eddie Kinuthia', 1),
  ('STU-7', 'Onyango opiyo', 4)
  ('STU-8', 'Jacyres Tagaeryan', 2)
  ('STU-9', 'Playboi Carti', 3)
  ('STU-10', 'Jon Snow', 4);

SELECT * FROM student;


CREATE TABLE instructor(
    instructor_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(20),
    office_room VARCHAR(20),
    phone_extension INT,
    email VARCHAR(25) UNIQUE
);

INSERT INTO instructor (instructor_id, name, department, office_room, phone_extension, email)
VALUES 
  (1, 'Jordan Carter', 'COPAS', 'SCC-100', 0112123243, 'jordanCarter67@gmail.com'),
  (2, 'Juliet Wangoi', 'COHRED', 'COH-100', 0777923243, 'JulietWangoi@gmail.com'),
  (3, 'Samuel Kiptoo', 'COHRED', 'EMB-100', 0789234992, 'SamuelKiptoo007@gmail.com');
INSERT INTO instructor(instructor_id, name, department, office_room, phone_extension, email) VALUES(4, 'Alvin Munene', 'COHES', 'PHA-100', 0531455992, 'alvinMunene2433@gmail.com');

SELECT * FROM instructor;

DROP TABLE course;
CREATE TABLE course(
    course_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    description TEXT,
    year_of_study INT,
    classroom VARCHAR(50),
    instructor_id INT,
    FOREIGN KEY(instructor_id) REFERENCES instructor(instructor_id)
);
--To ensure only 1st - 4th years courses are eligible for  registration for the semester
ALTER TABLE course ADD CONSTRAINT chk_course_year CHECK (year_of_study BETWEEN 1 AND 4);

INSERT INTO course (course_id, title, description, year_of_study, classroom, instructor_id)
VALUES 
  ('CS101', 'Computer Science', 'Programming and Coding', 2, "SCC-108", 1),
  ('CVE202', 'Civil Engineering', 'Construction', 2, "EMB-108", 2),
  ('BIO301', 'Biology', 'Study of Living Things', 3, "BIc-108", 3),
  ('PHAR401', 'Pharmacy', 'Study of drugs and medicine', 4, 'MED-108', 4),
  ('MED402', 'Medicical Science', 'Study of the human body, diseases, diagnosis, treatment, and prevention of illnesses', 4, 'MED-208', 4);

SELECT * FROM course;

DROP TABLE tutorial_section;
CREATE TABLE tutorial_section(
    ts_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10),
    ta_id VARCHAR(10),
    FOREIGN KEY(ta_id) REFERENCES teaching_assistant(ta_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id)
);

INSERT INTO tutorial_section (ts_id, course_id, ta_id)
VALUES 
  ('CS101-5', 'CS101', 'STU-1'),
  ('CVE202-5', 'CVE202', 'STU-2'),
  ('BIO301-5', 'BIO301', 'STU-3'),
  ('PHAR401-5', 'PHAR401', 'STU-4'),
  ('MED402-5', 'MED402', 'STU-5');

SELECT * FROM tutorial_section;

DROP TABLE teaching_assistant;
CREATE TABLE teaching_assistant(
    ta_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(20),
    office_room VARCHAR(10),
    phone_extension INT,
    email VARCHAR(25) UNIQUE,
    student_id VARCHAR(10),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);

INSERT INTO teaching_assistant (ta_id, name, department, office_room, phone_extension, email, student_id)
VALUES 
  ('TA-1', 'John Doe', 'COPAS', 'SCC-100', 0987654322, 'JohnDoe67@gmail.com', 'STU-1'),
  ('TA-2', 'Jane Smith', 'COHRED', 'COH-100', 0722863792, 'Janesmith@gmail.com','STU-2'),
  ('TA-3', 'Glen Kinyua', 'COHRED', 'EMB-100', 0770059322, 'GlenKinyua007@gmail.com', 'STU-4'),
  ('TA-4', 'Eddie Kinuthia', 'COHRED', 'EMB-100', 0735548942, 'eddiekinuthia@gmail.com', 'STU-5');

SELECT * FROM teaching_assistant;

DROP TABLE lab_section;
CREATE TABLE lab_section(
    ls_id VARCHAR(20) PRIMARY KEY,
    course_id VARCHAR(10),
    la_id VARCHAR(10),
    FOREIGN KEY(la_id) REFERENCES lab_assistant(la_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id)
);

INSERT INTO lab_section (ls_id, course_id, la_id)
VALUES 
  ('CS101-5-LAB', 'CS101', 'LA-1'),
  ('CVE202-5-LAB', 'CVE202', 'LA-2'),
  ('BIO301-5-LAB', 'BIO301', 'LA-6'),
  ('PHAR401-5-LAB', 'PHAR401', 'LA-3'),
  ('MED402-5-LAB', 'MED402', 'LA-4');

SELECT * FROM lab_section;

DROP TABLE lab_assistant;
CREATE TABLE lab_assistant(
    la_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(20),
    office_room VARCHAR(10),
    phone_extension INT,
    student_id VARCHAR(10),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);

INSERT INTO lab_assistant (la_id, name, department, office_room, phone_extension, student_id)
VALUES 
  ('LA-5', 'John Doe', 'COPAS', 'SCC-100', 0987654322, 'STU-1'),
  ('LA-2', 'Jane Smith', 'COHRED', 'COH-100', 0722863792,'STU-2'),
  ('LA-3', 'Eddie Kinuthia', 'COHRED', 'EMB-100', 0770059322, 'STU-5'),
  ('LA-4', 'Onyango opiyo', 'COHRED', 'EMB-100', 0735548942, 'STU-6');

SELECT * FROM lab_assistant;

--The PRIMARY KEY constraint is used to define a composite primary key consisting of both columns.
--This ensures that each row in the table is unique and can be identified by a combination of the course_id and prerequisite_id/antirequisite_id values.
CREATE TABLE course_prerequisite(
    prerequisite_id VARCHAR(10),
    course_id VARCHAR(10),
    PRIMARY KEY(course_id, prerequisite_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id),
    FOREIGN KEY(prerequisite_id) REFERENCES course(course_id)
);

INSERT INTO course_prerequisite(prerequisite_id, course_id)
VALUES
('BIO202', 'BIO301'),
('CVE201', 'CVE202'),
('MED401', 'MED402'),
('PHAR301', 'PHAR302');
SELECT * FROM course_prerequisite;

CREATE TABLE course_antirequisite(
    antirequisite_id VARCHAR(10),
    course_id VARCHAR(10),
    PRIMARY KEY(course_id, antirequisite_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id),
    FOREIGN KEY(antirequisite_id) REFERENCES course(course_id)
);
INSERT INTO course_antirequisite(antirequisite_id, course_id) VALUES ('CS101', 'CS101');
SELECT * FROM course_antirequisite;

DROP TABLE course_registration;
--ENUM is used in the grade variable to specify that the column can only take two values: 'pass' or 'fail'
CREATE TABLE course_registration(
    student_id VARCHAR(10),
    course_id VARCHAR(10),
    grade ENUM('pass', 'fail'),
    PRIMARY KEY(student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id)
);

INSERT INTO course_registration(student_id, course_id, grade)
VALUES
('STU-1', 'CS101', 'pass'),
('STU-2', 'CVE202', 'pass'),
('STU-4', 'MED402', 'pass'),
('STU-5', 'PHAR302', 'pass'),
('STU-6', 'MED402', 'pass');

SELECT * FROM course_registration;