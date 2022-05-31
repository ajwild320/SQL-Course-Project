USE TheMotorEmpire;

INSERT INTO ManagerAccount (managerID, firstName, lastName, phoneNum, email)
    VALUES (001,"John","Smith","7045562223","JohnSmith@gmail.com"),
	(002,"Bob","Allen","7045672234","BobAllen@gmail.com"),
	(003,"Jimmy","Hendricks","7046782345","JimmyHendricks@gmail.com");

INSERT INTO EmployeeAccount (employeeID, managerID, firstName, lastName, phoneNum, email, position)
    VALUES (004, 001, "Johnny","AppleSeed","9802245678","johnnyappleseed@gmail.com","Sales"),
	(005, 002, "Rick","Ross","9807415686","Rickross@gmail.com","HR"),
	(006, 003, "Alecia","Keys","9809863633","AleciaKeys@gmail.com","Inventory Manager");

INSERT INTO CustomerAccount (customerID, firstName, lastName, phoneNum, email, address, balance)
    VALUES (007, "Yo", "Gotti", "6784548558","YoGotti@gmail.com", "123 King St.", 11875.23),
	(008, "Jack", "Mehoff", "6787892354","JackMehoff@gmail.com","456 Queen St.", 6574.45),
	(009, "Andrew", "Kevin","6781124699","AndrewKevin@gmail.com","789 Joker St.",8954.12);

INSERT INTO CreditCard (cardNum, cardholderName, expDate, CVV, customerID)
    VALUES ("4268539648571244","Yo Gotti","0223",232,007),
	("2354852269665445","Jack Mehoff","0423",619,008),
	("7888569623110169","Andrew Kevin","0623",741,009);

INSERT INTO Cars (VINnum, manufacturer, model, year)
    VALUES ("JH4KA3140KC015221","Acura","Legend","1989"),
	("JH4NA1261PT000302","Acura","NSX","1993"),
	("YV1LS55A3X1588402","Volvo","S70","1999");

INSERT INTO EmployeeAccountCustomerAccount (customerID, employeeID, messages, sender)
    VALUES (007,004,"Hello How Are You", "customer"),
	(008,004,"Good Morning", "employee"),
	(009,004,"Thank you come again", "customer");

INSERT INTO Supplier (supplierID, name, phoneNum, email)
    VALUES (010,"Car Haven","40455748569","CarHaven@gmail.com"),
	(011,"CarSupplerPlus","4045681457","CarSuppliesPlus@gmail.com"),
	(012,"MotorKingdom","4049963232","MotorKingdom@gmail.com");

INSERT INTO SearchCars (customerID, employeeID, VINnum)
    VALUES (007,004,"JH4KA3140KC015221"),
	(008,004,"JH4NA1261PT000302"),
	(009,004,"YV1LS55A3X1588402");

