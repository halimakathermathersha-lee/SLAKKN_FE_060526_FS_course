-- SQL Trigger Practical Tasks
-- MySQL
-- Based on the columns used in the previous teaemp questions:
-- empid, empname, empdepart, empsalary
--
-- NOTE: Tasks 5-8 were not included in the question provided,
-- so this file contains Tasks 1-4, 9 and 10.

DELIMITER $$


-- ============================================================
-- TASK 1 - AFTER INSERT TRIGGER
-- Backup every newly inserted employee
-- ============================================================

CREATE TABLE IF NOT EXISTS emp_insert_backup
LIKE teaemp;

DROP TRIGGER IF EXISTS trg_emp_after_insert$$

CREATE TRIGGER trg_emp_after_insert
AFTER INSERT ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_insert_backup
    VALUES
    (
        NEW.empid,
        NEW.empname,
        NEW.empdepart,
        NEW.empsalary
    );
END$$


-- ============================================================
-- TASK 2 - AFTER UPDATE TRIGGER
-- Store employee ID, name, old salary and new salary
-- ============================================================

CREATE TABLE IF NOT EXISTS emp_update_backup
(
    empid INT,
    empname VARCHAR(100),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2)
)$$

DROP TRIGGER IF EXISTS trg_emp_after_update$$

CREATE TRIGGER trg_emp_after_update
AFTER UPDATE ON teaemp
FOR EACH ROW
BEGIN
    IF OLD.empsalary <> NEW.empsalary THEN
        INSERT INTO emp_update_backup
        VALUES
        (
            OLD.empid,
            OLD.empname,
            OLD.empsalary,
            NEW.empsalary
        );
    END IF;
END$$


-- ============================================================
-- TASK 3 - AFTER DELETE TRIGGER
-- Backup the deleted employee record
-- ============================================================

CREATE TABLE IF NOT EXISTS emp_delete_backup
LIKE teaemp;

DROP TRIGGER IF EXISTS trg_emp_after_delete$$

CREATE TRIGGER trg_emp_after_delete
AFTER DELETE ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_delete_backup
    VALUES
    (
        OLD.empid,
        OLD.empname,
        OLD.empdepart,
        OLD.empsalary
    );
END$$


-- ============================================================
-- TASK 4 - BEFORE INSERT TRIGGER
-- If salary is less than 15000, change it to 15000
-- ============================================================

DROP TRIGGER IF EXISTS trg_emp_before_insert$$

CREATE TRIGGER trg_emp_before_insert
BEFORE INSERT ON teaemp
FOR EACH ROW
BEGIN
    IF NEW.empsalary < 15000 THEN
        SET NEW.empsalary = 15000;
    END IF;
END$$


-- ============================================================
-- TASK 5 - 8
-- Not provided in the question.
-- ============================================================


-- ============================================================
-- TASK 9 - PRODUCT BACKUP
-- Whenever a product is updated, store old product details
-- ============================================================

CREATE TABLE IF NOT EXISTS product_backup
LIKE teaproduct;

DROP TRIGGER IF EXISTS trg_product_after_update$$

CREATE TRIGGER trg_product_after_update
AFTER UPDATE ON teaproduct
FOR EACH ROW
BEGIN
    INSERT INTO product_backup
    SELECT OLD.*;
END$$


-- ============================================================
-- TASK 10 - CUSTOMER AUDIT
-- Store INSERT / UPDATE / DELETE activities
-- ============================================================

CREATE TABLE IF NOT EXISTS customer_audit
(
    customer_id INT,
    customer_name VARCHAR(100),
    operation VARCHAR(10),
    activity_datetime DATETIME
)$$


-- INSERT AUDIT
DROP TRIGGER IF EXISTS trg_customer_after_insert$$

CREATE TRIGGER trg_customer_after_insert
AFTER INSERT ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES
    (
        NEW.customerid,
        NEW.customername,
        'INSERT',
        NOW()
    );
END$$


-- UPDATE AUDIT
DROP TRIGGER IF EXISTS trg_customer_after_update$$

CREATE TRIGGER trg_customer_after_update
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES
    (
        NEW.customerid,
        NEW.customername,
        'UPDATE',
        NOW()
    );
END$$


-- DELETE AUDIT
DROP TRIGGER IF EXISTS trg_customer_after_delete$$

CREATE TRIGGER trg_customer_after_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES
    (
        OLD.customerid,
        OLD.customername,
        'DELETE',
        NOW()
    );
END$$


DELIMITER ;


-- ============================================================
-- QUICK CHECK
-- ============================================================

SELECT * FROM emp_insert_backup;
SELECT * FROM emp_update_backup;
SELECT * FROM emp_delete_backup;
SELECT * FROM product_backup;
SELECT * FROM customer_audit;
