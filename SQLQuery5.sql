
-- creation of DateDim Table, DateDim stores the dates of the runs
CREATE TABLE DateDim (
	DateID int PRIMARY KEY,
	Date DATE,
	Day int,
	Month int,
	Year int
);

--creation of LocationDim: stores the locations of your runs
CREATE TABLE LocationDim (
	LocationID int PRIMARY KEY,
	LocationName VARCHAR(50),
	City VARCHAR(50),
	State VARCHAR(50)
);

--creation of the User_dim: stores user information
CREATE TABLE User_Dim(
	UserID int PRIMARY KEY,
	Username VARCHAR(50),
	Gender VARCHAR(10),
	Age int,
	weight int,
	height decimal(3,2)
);

-- creation of the Weather_Dim: stores weather conditions during the run
CREATE TABLE Weather_Dim (
	WeatherID INT PRIMARY KEY,
	WeatherType VARCHAR(30),
	Temperature FLOAT,
	Humidity INT
);

-- creation of the fact table- will store the actual data of runs.
CREATE TABLE RunFacts (
	RunID INT PRIMARY KEY,
	UserID INT,
	DateID INT,
	LocationID INT,
	Distance FLOAT,
	Duration TIME,
	CaloriesBurned INT,
	WeatherID INT,
	-- creation of foreign key to link dimension tables to fact tables
	FOREIGN KEY (DateID) REFERENCES DateDim(DateID),
	FOREIGN KEY(LocationID) REFERENCES LocationDIM(LocationID),
	FOREIGN KEY(WeatherID) REFERENCES Weather_DIM,
	FOREIGN KEY(UserID) REFERENCES User_DIM(UserID)


);