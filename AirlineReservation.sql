
CREATE DATABASE AirlineReservation;

USE airlinereservation;


#DROP TABLE IF EXISTS ValidClassTypes;
#CREATE TABLE ValidClassTypes (
#	classType VARCHAR(30) NOT NULL,
#    PRIMARY KEY(classType)
#);

#INSERT INTO ValidClassTypes VALUES("FirstClass");
#INSERT INTO ValidClassTypes VALUES("Business");
#INSERT INTO ValidClassTypes VALUES("Economy");





DROP TABLE IF EXISTS Seats;
CREATE TABLE Seats (
   seatNum INT NOT NULL CHECK (seatNum > 0 AND seatNum <= 20),
   classType VARCHAR(30) NOT NULL CHECK (classType IN (‘Economy’, ‘Business’, ‘FirstClass’)),
   PRIMARY KEY (seatNum)
);

INSERT INTO Seats VALUES(1, "Firstdlass");
INSERT INTO Seats VALUES(2, "FirstClass");
INSERT INTO Seats VALUES(3, "FirstClass");
INSERT INTO Seats VALUES(4, "FirstClass");

INSERT INTO Seats VALUES(5, "Business");
INSERT INTO Seats VALUES(6, "Business");
INSERT INTO Seats VALUES(7, "Business");
INSERT INTO Seats VALUES(8, "Business");

INSERT INTO Seats VALUES(9, "Economy");
INSERT INTO Seats VALUES(10, "Economy");
INSERT INTO Seats VALUES(11, "Economy");
INSERT INTO Seats VALUES(12, "Economy");
INSERT INTO Seats VALUES(13, "Economy");
INSERT INTO Seats VALUES(14, "Economy");
INSERT INTO Seats VALUES(15, "Economy");
INSERT INTO Seats VALUES(16, "Economy");
INSERT INTO Seats VALUES(17, "Economy");
INSERT INTO Seats VALUES(18, "Economy");
INSERT INTO Seats VALUES(19, "Economy");
INSERT INTO Seats VALUES(20, "Economy");


SELECT * from SEATS;

DROP TABLE IF EXISTS Persons;
CREATE TABLE Persons (
   personId INT NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(30),
   lastName VARCHAR(30),
   age INT,
   PRIMARY KEY (personId)
);

INSERT INTO Persons(personId, firstName, lastName, age) VALUES(1000, "John", "Smith", 39);
INSERT INTO Persons(firstName, lastName, age) VALUES("Maria", "Porter", 25);
INSERT INTO Persons(firstName, lastName, age) VALUES("Allison", "Smith", 47);
INSERT INTO Persons(firstName, lastName, age) VALUES("Ellen", "Hansen", 12);
INSERT INTO Persons(firstName, lastName, age) VALUES("Amos", "Tristen", 19);
INSERT INTO Persons(firstName, lastName, age) VALUES("Rob", "Smith", 39);
INSERT INTO Persons(firstName, lastName, age) VALUES("James", "Porter", 25);
INSERT INTO Persons(firstName, lastName, age) VALUES("Emily", "Segue", 47);
INSERT INTO Persons(firstName, lastName, age) VALUES("Samantha", "Stanton", 12);
INSERT INTO Persons(firstName, lastName, age) VALUES("Justin", "Rodriguez", 19);

SELECT * FROM Persons;

DROP TABLE IF EXISTS Plane;
CREATE TABLE Plane (
   planeId INT NOT NULL AUTO_INCREMENT,
   airlineName VARCHAR(30) NOT NULL REFERENCES AirlineCompany(airlineName),
   fromLoc VARCHAR(30) NOT NULL,
   toLoc VARCHAR(30) NOT NULL,
   PRIMARY KEY (planeId) 
);

INSERT INTO Plane(planeId, airlineName, fromLoc, toLoc) VALUES(2000, "Southwest Airlines", "Chicago", "New York");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Southwest Airlines", "Columbus", "Montgomery");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Southwest Airlines", "Helena", "Denver");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Singapore Airlines", "San Francisco", "Hong Kong");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Singapore Airlines", "Little Rock", "Massachussets");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Northwestern Airlines", "Anchorage", "Salt Lake City");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Northwestern Airlines", "Albany", "Madison");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Seattle Airlines", "Los Angeles", "Indianapolis");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Seattle Airlines", "Pheonix", "San Jose");
INSERT INTO Plane(airlineName, fromLoc, toLoc) VALUES("Hawaiian Airlines", "Sacramento", "Olympia");

SELECT * FROM Plane;

DROP TABLE IF EXISTS Travel;
CREATE TABLE Travel (
  travelId INT NOT NULL AUTO_INCREMENT,
  personId INT NOT NULL REFERENCES Persons(personId),
  planeId INT NOT NULL REFERENCES Plane(planeId),
  seatNum INT NOT NULL REFERENCES Seats(seatNum),
  PRIMARY KEY(travelId)
);

SELECT * FROM Travel;

INSERT INTO Travel(personId, planeId, seatNum) VALUES (1035, 2000, 1); 



DROP TABLE IF EXISTS AirlineCompany;
CREATE TABLE AirlineCompany (
  airlineName VARCHAR(30) NOT NULL,
  phoneNumber VARCHAR(30),
  PRIMARY KEY(airlineName)
);

INSERT INTO AirlineCompany VALUES("Southwest Airlines", "(555)567-5555");
INSERT INTO AirlineCompany VALUES("Singapore Airlines", "(256)564-5555");
INSERT INTO AirlineCompany VALUES("Northwestern Airlines", "(324)645-5645");
INSERT INTO AirlineCompany VALUES("Seattle Airlines", "(356)566-7889");
INSERT INTO AirlineCompany VALUES("Hawaiian Airlines", "(745)565-8964");

SELECT * FROM AirlineCompany;


