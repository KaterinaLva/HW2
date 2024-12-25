CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    manager_id INT,
    CONSTRAINT fk_department FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE CASCADE,
    CONSTRAINT fk_manager FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL,
    CONSTRAINT chk_manager CHECK (manager_id <> employee_id)
);