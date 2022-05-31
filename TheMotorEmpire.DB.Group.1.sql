CREATE DATABASE IF NOT EXISTS TheMotorEmpire;

USE TheMotorEmpire;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS ManagerAccount;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS CreditCard;
DROP TABLE IF EXISTS EmployeeAccount;
DROP TABLE IF EXISTS CustomerAccount;
DROP TABLE IF EXISTS EmployeeAccountCustomerAccount;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS SearchCars;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS ManagerAccount (
	managerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    phoneNum VARCHAR(13) NOT NULL,
    email VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Supplier (
	supplierID INT UNSIGNED PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    phoneNum VARCHAR(13) NOT NULL,
    email VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS CustomerAccount (
	customerID INT UNSIGNED PRIMARY KEY,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    email VARCHAR(80) NOT NULL,
    phoneNum VARCHAR(13) NOT NULL,
    address VARCHAR(100) NOT NULL,
    balance DECIMAL(7,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS EmployeeAccount (
	employeeID INT UNSIGNED PRIMARY KEY,
    managerID INT UNSIGNED,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    email VARCHAR(80) NOT NULL,
    phoneNum VARCHAR(13) NOT NULL,
    position VARCHAR(50) NOT NULL
		CONSTRAINT positionCheck CHECK (position IN("Sales", "HR", "Manager", "Inventory Manager")),
	FOREIGN KEY (managerID) REFERENCES ManagerAccount(managerID)
);

CREATE TABLE IF NOT EXISTS CreditCard (
	cardNum VARCHAR(20) PRIMARY KEY, 
    cardHolderName VARCHAR(60) NOT NULL,
    expDate CHAR(5) NOT NULL,
    CVV INT(3) NOT NULL,
    customerID INT UNSIGNED NOT NULL,
    FOREIGN KEY (customerID) REFERENCES CustomerAccount (customerID)
);

CREATE TABLE IF NOT EXISTS EmployeeAccountCustomerAccount (
	customerID INT UNSIGNED,
    employeeID INT UNSIGNED,
    sender CHAR(8) NOT NULL
		CONSTRAINT senderCheck CHECK (sender IN('customer', 'employee')),
	messages VARCHAR(150) NOT NULL,
    PRIMARY KEY (customerID, employeeID),
    FOREIGN KEY (customerID) REFERENCES CustomerAccount(customerID),
    FOREIGN KEY (employeeID) REFERENCES EmployeeAccount(employeeID)
);

CREATE TABLE IF NOT EXISTS Cars (
	VINnum VARCHAR(17) PRIMARY KEY,
    manufacturer VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    year CHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS SearchCars (
    VINnum VARCHAR(17),
    employeeID INT UNSIGNED,
    customerID INT UNSIGNED,
    PRIMARY KEY (VINnum, employeeID, customerID),
    FOREIGN KEY (customerID) REFERENCES CustomerAccount(customerID),
    FOREIGN KEY (employeeID) REFERENCES EmployeeAccount(employeeID),
	FOREIGN KEY (VINnum) REFERENCES Cars(VINnum)
);
