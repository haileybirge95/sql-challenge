- TABLE SCHEMATA

-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(30) NOT NULL
);

-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(10) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

-- Add constraint to departments table
ALTER TABLE departments
ADD CONSTRAINT unique_dept_no UNIQUE (dept_no);

-- Create employees table 
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(10) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex CHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

-- Add employees table constraints and foreign keys 
ALTER TABLE employees
ADD CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE employees
ADD CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

-- Create department employees table 
CREATE TABLE department_employees (
  emp_no INT,
  dept_no VARCHAR(10),
  PRIMARY KEY (emp_no, dept_no)
);

-- Add department employees table constraints and foreign keys
ALTER TABLE department_employees
ADD CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE department_employees
ADD CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

-- Create department managers table 
CREATE TABLE department_managers (
  dept_no VARCHAR(10),
  emp_no INT,
  UNIQUE (emp_no, dept_no)
);

-- Add department managers table constraints and foreign keys 
ALTER TABLE department_managers
ADD CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE department_managers
ADD CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

-- Create salaries table 
CREATE TABLE salaries (
  emp_no INT PRIMARY KEY,
  salary INT NOT NULL
); 

-- Add salaries table constraints and foreign keys
ALTER TABLE salaries
ADD CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);