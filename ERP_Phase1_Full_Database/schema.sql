
CREATE DATABASE IF NOT EXISTS erp_suite;
USE erp_suite;

CREATE TABLE roles (
 role_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 role_name VARCHAR(50) UNIQUE NOT NULL,
 description VARCHAR(255)
);

CREATE TABLE users (
 user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(100) UNIQUE,
 password VARCHAR(255),
 email VARCHAR(255),
 role_id BIGINT,
 status VARCHAR(20),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

CREATE TABLE departments (
 department_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 department_name VARCHAR(100),
 location VARCHAR(100),
 budget DECIMAL(15,2)
);

CREATE TABLE employees (
 employee_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(100),
 last_name VARCHAR(100),
 gender VARCHAR(20),
 dob DATE,
 phone VARCHAR(15),
 joining_date DATE,
 salary DECIMAL(12,2),
 department_id BIGINT,
 user_id BIGINT,
 FOREIGN KEY(department_id) REFERENCES departments(department_id),
 FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE attendance (
 attendance_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 employee_id BIGINT,
 attendance_date DATE,
 check_in TIME,
 check_out TIME,
 status VARCHAR(20),
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE payroll (
 payroll_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 employee_id BIGINT,
 basic_salary DECIMAL(12,2),
 bonus DECIMAL(12,2),
 deductions DECIMAL(12,2),
 net_salary DECIMAL(12,2),
 pay_month VARCHAR(20),
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE leads (
 lead_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 lead_name VARCHAR(100),
 company VARCHAR(150),
 email VARCHAR(255),
 phone VARCHAR(20),
 source VARCHAR(100),
 status VARCHAR(50)
);

CREATE TABLE customers (
 customer_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 customer_name VARCHAR(150),
 email VARCHAR(255),
 phone VARCHAR(20),
 city VARCHAR(100),
 customer_type VARCHAR(50)
);

CREATE TABLE lead_conversion (
 conversion_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 lead_id BIGINT,
 customer_id BIGINT,
 conversion_date DATE,
 FOREIGN KEY(lead_id) REFERENCES leads(lead_id),
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE ticket_categories (
 category_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 category_name VARCHAR(100)
);

CREATE TABLE tickets (
 ticket_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(255),
 description TEXT,
 priority VARCHAR(20),
 status VARCHAR(30),
 category_id BIGINT,
 customer_id BIGINT,
 assigned_employee BIGINT,
 FOREIGN KEY(category_id) REFERENCES ticket_categories(category_id),
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY(assigned_employee) REFERENCES employees(employee_id)
);

CREATE TABLE sla_tracking (
 sla_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 ticket_id BIGINT,
 response_time_hours INT,
 resolution_time_hours INT,
 sla_status VARCHAR(50),
 FOREIGN KEY(ticket_id) REFERENCES tickets(ticket_id)
);

CREATE TABLE projects (
 project_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 project_name VARCHAR(200),
 start_date DATE,
 end_date DATE,
 budget DECIMAL(15,2),
 status VARCHAR(50)
);

CREATE TABLE employee_projects (
 employee_project_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 employee_id BIGINT,
 project_id BIGINT,
 assigned_date DATE,
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
 FOREIGN KEY(project_id) REFERENCES projects(project_id)
);

CREATE TABLE audit_logs (
 audit_id BIGINT PRIMARY KEY AUTO_INCREMENT,
 action_type VARCHAR(100),
 table_name VARCHAR(100),
 action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 performed_by BIGINT
);
