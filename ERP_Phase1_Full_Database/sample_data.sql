
INSERT INTO roles(role_name,description) VALUES
('ADMIN','System Administrator'),
('MANAGER','Department Manager'),
('EMPLOYEE','Regular Employee');

INSERT INTO departments(department_name,location,budget)
VALUES ('IT','Kolkata',5000000),('HR','Kolkata',1500000);

INSERT INTO users(username,password,email,role_id,status)
VALUES ('admin','$2a$demo','admin@erp.com',1,'ACTIVE');
