-- Create the database if it does not exist
    CREATE DATABASE IF NOT EXISTS hr_micromanagement;

    -- Use the created database
    USE hr_micromanagement;

    -- Create Departments table
    CREATE TABLE IF NOT EXISTS departments (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL UNIQUE,
        location VARCHAR(100) NOT NULL
    );

    -- Create Employees table
    CREATE TABLE IF NOT EXISTS employees (
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        phone_number VARCHAR(15),
        hire_date DATE NOT NULL,
        job_id INT NOT NULL,
        salary DECIMAL(10, 2) NOT NULL CHECK (salary > 0),
        department_id INT,
        FOREIGN KEY (department_id) REFERENCES departments(id)
    );

    -- Create Jobs table
    CREATE TABLE IF NOT EXISTS jobs (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        min_salary DECIMAL(10, 2) CHECK (min_salary >= 0),
        max_salary DECIMAL(10, 2)
    );

    -- Create Projects table
    CREATE TABLE IF NOT EXISTS projects (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE,
        budget DECIMAL(15, 2) CHECK (budget >= 0)
    );

    -- Create Employee_Projects table (many-to-many relationship)
    CREATE TABLE IF NOT EXISTS employee_projects (
        employee_id INT,
        project_id INT,
        PRIMARY KEY (employee_id, project_id),
        FOREIGN KEY (employee_id) REFERENCES employees(id),
        FOREIGN KEY (project_id) REFERENCES projects(id)
    );

    -- Triggers to enforce max_salary >= min_salary in jobs table
    DELIMITER //

    CREATE TRIGGER check_jobs_salary BEFORE INSERT ON jobs
    FOR EACH ROW
    BEGIN
        IF NEW.max_salary < NEW.min_salary THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'max_salary must be greater than or equal to min_salary';
        END IF;
    END //

    CREATE TRIGGER check_jobs_salary_update BEFORE UPDATE ON jobs
    FOR EACH ROW
    BEGIN
        IF NEW.max_salary < NEW.min_salary THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'max_salary must be greater than or equal to min_salary';
        END IF;
    END //

    DELIMITER ;
