---CREATING THE TABLES FOR USERS---
/*
* These are going to be used for
* administrative purposes.
*/
CREATE TABLE User_Type(
    id INT NOT NULL PRIMARY KEY,
    u_type VARCHAR(15) NOT NULL
);


CREATE TABLE Usr(
    id INT NOT NULL PRIMARY KEY,
    u_name VARCHAR(15) NOT NULL,
    pwd_hash VARCHAR(32) NOT NULL,
    u_type_id INT NOT NULL,
    FOREIGN KEY (u_type_id) REFERENCES User_Type(id)
);--- PLEASE NOTE THAT FOR SECURITY REASEONS WE ARE NOT STORING THE PASSWORD AS PLAIN TEXT.---


---CREATING THE MAIN SCHEMA---
/*
* These tables are going to be the ones the system
* will mostly relly on.
*/

CREATE TABLE Emp_Position(
    id INT NOT NULL PRIMARY KEY,
    position_name VARCHAR(15) NOT NULL
);

CREATE TABLE Employee(
    emp_number INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    mothers_last_name VARCHAR(15) NOT NULL,
    score INT NOT NULL,
    position_id INT NOT NULL,
    FOREIGN KEY (position_id) REFERENCES Emp_Position(id)
);

CREATE TABLE Branch(
    tin VARCHAR(15)NOT NULL PRIMARY KEY,
    branch_name VARCHAR(25) NOT NULL,
    adress1 VARCHAR(50) NOT NULL,
    adress2 VARCHAR(50) NOT NULL
);

CREATE TABLE Recurrency(
    id INT NOT NULL PRIMARY KEY ,
    recurrency VARCHAR(15) NOT NULL
);

CREATE TABLE Task(
    id INT NOT NULL PRIMARY KEY,
    task_name VARCHAR(15) NOT NULL,
    task_description TEXT NOT NULL,
    task_value INT NOT NULL,
    recurrency_id INT NOT NULL,
    FOREIGN KEY (recurrency_id) REFERENCES Recurrency(id)
);

CREATE TABLE Employee_Branch(
    employee_id INT NOT NULL,
    branch_id VARCHAR(15) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(emp_number),
    FOREIGN KEY (branch_id) REFERENCES Branch(tin)
);

CREATE TABLE Task_Branch(
    task_id INT NOT NULL,
    branch_id VARCHAR(15) NOT NULL,
    FOREIGN KEY (task_id) REFERENCES Task(id),
    FOREIGN KEY (branch_id) REFERENCES Branch(tin)
);

CREATE TABLE Task_Status(
    id INT NOT NULL PRIMARY KEY,
    task_status VARCHAR(15) NOT NULL
);

CREATE TABLE Task_Report(
    id INT NOT NULL PRIMARY KEY,
    report_date DATE NOT NULL,
    branch_id VARCHAR(15) NOT NULL,
    employee_id INT NOT NULL,
    task_id INT NOT NULL,
    status_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(tin),
    FOREIGN KEY (employee_id) REFERENCES Employee(emp_number),
    FOREIGN KEY (task_id) REFERENCES Task(id),
    FOREIGN KEY (status_id) REFERENCES Task_Status(id)
);