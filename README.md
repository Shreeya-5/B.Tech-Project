# B.Tech-Project

I have used oracle databse to save the data of the project. I have created the tables in database.

DATABASE

-- Table for users
CREATE TABLE users (
    User_email VARCHAR2(50) NOT NULL PRIMARY KEY,
    User_name VARCHAR2(20) NOT NULL,
    User_mob VARCHAR2(15),
    User_pass VARCHAR2(15) NOT NULL,
    Dept_name VARCHAR2(50)
);

-- Table for courses
CREATE TABLE course (
    Course_code VARCHAR2(50) NOT NULL PRIMARY KEY,
    Course_name VARCHAR2(50) NOT NULL,
    Dept_name VARCHAR2(50),
    User_email VARCHAR2(50),
    CONSTRAINT fk_course_users
        FOREIGN KEY (User_email)
        REFERENCES users(User_email)
);

-- Table for units
CREATE TABLE unit (
      Unit_no VARCHAR2(50) NOT NULL,
      Course_code VARCHAR2(50) NOT NULL,
      Unit_name VARCHAR2(50) NOT NULL,
      PRIMARY KEY (Unit_no, Course_code),
      FOREIGN KEY (Course_code) REFERENCES course(Course_code)
 );


-- Table for mapping users and courses
CREATE TABLE UserCourse (
    User_email VARCHAR2(50),
    Course_code VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_usercourse_users
        FOREIGN KEY (User_email)
        REFERENCES users(User_email),
    CONSTRAINT fk_usercourse_course
        FOREIGN KEY (Course_code)
        REFERENCES course(Course_code),
    PRIMARY KEY (User_email, Course_code)
);

-- Sequence for Subtopic_id
CREATE SEQUENCE subtopic_sequence
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Table for Subtopics
CREATE TABLE Subtopic (
    Subtopic_id NUMBER DEFAULT subtopic_sequence.NEXTVAL PRIMARY KEY,
    Subtopic_name VARCHAR2(50) NOT NULL,
    Unit_no VARCHAR2(50) NOT NULL,
    Course_code VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_subtopic_unit
        FOREIGN KEY (Unit_no, Course_code)
        REFERENCES unit(Unit_no, Course_code)
);

-- Sequence for Que_No
CREATE SEQUENCE question_sequence
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Table for QuestionBank
CREATE TABLE QuestionBank (
    Que_No NUMBER DEFAULT question_sequence.NEXTVAL PRIMARY KEY,
    Subtopic_id NUMBER,
    Que_Text VARCHAR2(255),
    Marks NUMBER,
    Diff_Level VARCHAR2(20),
    Que_type VARCHAR2(20),
    FOREIGN KEY (Subtopic_id)
        REFERENCES Subtopic(Subtopic_id)
);

