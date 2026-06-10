
DELIMITER //
CREATE TRIGGER trg_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
INSERT INTO audit_logs(action_type,table_name)
VALUES('INSERT','employees');
END //
DELIMITER ;
