# run_app_databasedesign



# RunTrack iOS App Database Design

This repository contains the SQL code for the database design of a running tracking iOS app. The database is designed using a star schema to efficiently store and manage data related to users' runs.

## Database Schema

The database schema is composed of one fact table and four dimension tables. The fact table, `RunFacts`, stores the actual data of the runs, while the dimension tables provide additional context and descriptive information about the runs.

### Tables

#### `DateDim`

The `DateDim` table stores the dates of the runs.

```sql
CREATE TABLE DateDim (
    DateID int PRIMARY KEY,
    Date DATE,
    Day int,
    Month int,
    Year int
);
```

#### `LocationDim`

The `LocationDim` table stores the locations of the runs.

```sql
CREATE TABLE LocationDim (
    LocationID int PRIMARY KEY,
    LocationName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);
```

#### `User_Dim`

The `User_Dim` table stores user information.

```sql
CREATE TABLE User_Dim (
    UserID int PRIMARY KEY,
    Username VARCHAR(50),
    Gender VARCHAR(10),
    Age int,
    Weight int,
    Height decimal(3,2)
);
```

#### `Weather_Dim`

The `Weather_Dim` table stores weather conditions during the run.

```sql
CREATE TABLE Weather_Dim (
    WeatherID INT PRIMARY KEY,
    WeatherType VARCHAR(30),
    Temperature FLOAT,
    Humidity INT
);
```

#### `RunFacts`

The `RunFacts` table stores the actual data of the runs and links to the dimension tables via foreign keys.

```sql
CREATE TABLE RunFacts (
    RunID INT PRIMARY KEY,
    UserID INT,
    DateID INT,
    LocationID INT,
    Distance FLOAT,
    Duration TIME,
    CaloriesBurned INT,
    WeatherID INT,
    FOREIGN KEY (DateID) REFERENCES DateDim(DateID),
    FOREIGN KEY (LocationID) REFERENCES LocationDim(LocationID),
    FOREIGN KEY (WeatherID) REFERENCES Weather_Dim(WeatherID),
    FOREIGN KEY (UserID) REFERENCES User_Dim(UserID)
);
```

## Getting Started

To set up the database:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/RunTrackDatabase.git
    cd RunTrackDatabase
    ```

2. **Create the database and tables**:
    - Open your SQL client and run the provided SQL code to create the tables.

3. **Populate the tables**:
    - Insert sample data into the dimension tables (`DateDim`, `LocationDim`, `User_Dim`, `Weather_Dim`).
    - Insert sample data into the fact table (`RunFacts`).

## Usage

This database design can be used as the backend for an iOS app that tracks users' running activities. The star schema allows for efficient querying and analysis of the running data, providing valuable insights into users' running habits, locations, and performance under different weather conditions.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to create a pull request or open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



