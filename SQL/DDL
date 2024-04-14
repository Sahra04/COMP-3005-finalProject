-- DDL File for Health and Fitness Club Management System Database

-- Table: Members
CREATE TABLE Members (
    member_username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address TEXT,
    phone_number VARCHAR(50)
);

-- Table: Staff
CREATE TABLE Staff (
    staff_username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

-- Table: Trainers
CREATE TABLE Trainers (
    trainer_username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,                      
	email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address TEXT,
    phone_number VARCHAR(50)
);

-- Table: EquipmentMaintenance
CREATE TABLE EquipmentMaintenance (
    equipment_id INTEGER PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    previous_checkup DATE,
    next_checkup DATE,
    cleanliness VARCHAR(50) NOT NULL, 
    quality VARCHAR(50) NOT NULL, 
    -- Additional Constraints
    CHECK (previous_checkup IS NULL OR previous_checkup <= CURRENT_DATE)
);

-- Table: HealthMetrics
CREATE TABLE HealthMetrics (
    health_metric_id SERIAL PRIMARY KEY,
    member_username VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    weight DECIMAL,
    height DECIMAL,
    body_fat_percentage DECIMAL,
    -- Additional Constraints
    FOREIGN KEY (member_username) REFERENCES Members(member_username) on delete cascade,
    CHECK (weight > 0),
    CHECK (height > 0)
);

-- Table: Sessions
CREATE TABLE Sessions (
    session_id SERIAL PRIMARY KEY,
    trainer_username VARCHAR(50) NOT NULL,
    member_username VARCHAR(50),
    trainer_name VARCHAR(50),
    session_date DATE NOT NULL,
    start_time VARCHAR(20) NOT NULL,
    end_time VARCHAR(20) NOT NULL,
    session_type VARCHAR(20) NOT NULL,
    -- Additional Constraints
    FOREIGN KEY (trainer_username) REFERENCES Trainers(trainer_username) on delete cascade,
    FOREIGN KEY (member_username) REFERENCES Members(member_username) on delete cascade
);

-- Table: Bills
CREATE TABLE Bills (
    bill_id INTEGER PRIMARY KEY,
    member_username VARCHAR(50) NOT NULL,
    member_fullname VARCHAR(50) NOT NULL,
    details VARCHAR(100) NOT NULL,
    billing_date DATE NOT NULL,
    amount DECIMAL NOT NULL,
    payment_status BOOLEAN DEFAULT FALSE,
    -- Additional Constraints
    FOREIGN KEY (member_username) REFERENCES Members(member_username) on delete cascade,
    CHECK (amount > 0)
);

-- Table: RoomBookings
CREATE TABLE RoomBookings (
    room_number INTEGER PRIMARY KEY,
    available BOOLEAN DEFAULT TRUE
);

-- Table: Classes
CREATE TABLE Classes (
    class_id INTEGER PRIMARY KEY,
    class_type VARCHAR(100) NOT NULL,
    class_date DATE NOT NULL,
    room_number INTEGER
);

--Fitness Goals
CREATE TABLE FitnessGoals (
    fitness_id SERIAL PRIMARY KEY, 
    member_username VARCHAR(50) NOT NULL,
    goal_description VARCHAR(100) NOT NULL,
    time_interval VARCHAR(50) NOT NULL,
    achieved BOOLEAN DEFAULT FALSE, 
     -- Additional Constraints
    FOREIGN KEY (member_username) REFERENCES Members(member_username) on delete cascade
);

--Fitness Goals
CREATE TABLE ExerciseRoutines (
    exercise_id SERIAL PRIMARY KEY, 
    member_username VARCHAR(50) NOT NULL,
    routines VARCHAR(100),
     -- Additional Constraints
    FOREIGN KEY (member_username) REFERENCES Members(member_username) on delete cascade
);

-- Table: Monitors
CREATE TABLE Monitors (
    staff_username VARCHAR(50),
    equipment_id INT,
    PRIMARY KEY (staff_username, equipment_id),
    FOREIGN KEY (staff_username) REFERENCES Staff(staff_username) on delete cascade,
    FOREIGN KEY (equipment_id)  REFERENCES EquipmentMaintenance(equipment_id) on delete cascade
);

-- Table: Process
CREATE TABLE  Process(
    staff_username VARCHAR(50), 
    bill_id INT,
    PRIMARY KEY (staff_username, bill_id),
    FOREIGN KEY (staff_username) REFERENCES Staff(staff_username) on delete cascade,
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id) on delete cascade
);

-- Table: Updates
CREATE TABLE Updates (
    staff_username VARCHAR(50),
    class_id INT,
    PRIMARY KEY (staff_username, class_id),
    FOREIGN KEY (staff_username) REFERENCES Staff(staff_username) on delete cascade,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id) on delete cascade
);

-- Table: Register
CREATE TABLE Register (
    class_id INT,
    member_username VARCHAR(50),
    PRIMARY KEY (class_id, member_username),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id) on delete cascade,
    FOREIGN KEY (member_username) REFERENCES Members(member_username) on delete cascade
);

-- Table: Manages
CREATE TABLE Manages (
    staff_username VARCHAR(50),
    room_number INT,
    PRIMARY KEY (staff_username, room_number),
    FOREIGN KEY (staff_username) REFERENCES Staff(staff_username) on delete cascade,
    FOREIGN KEY (room_number) REFERENCES RoomBookings(room_number) on delete cascade
);
