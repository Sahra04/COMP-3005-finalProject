--resetting insides of table

delete from Members; 
delete from Staff; 
delete from Trainers;
delete from EquipmentMaintenance;
delete from Bills; 
delete from RoomBookings; 
delete from Classes; 
delete from Sessions;
delete from HealthMetrics;
delete from FitnessGoals; 
delete from ExerciseRoutines;
delete from Monitors; 
delete from Process;
delete from Updates;
delete from Register; 
delete from Manages;


-- Add 3 members
INSERT INTO Members (member_username, password, email, full_name, date_of_birth, gender, address, phone_number)
VALUES 
    ('member1', 'password1', 'member1@example.com', 'John Doe', '1990-01-01', 'Male', '123 Main St', '1234567890'),
    ('member2', 'password2', 'member2@example.com', 'Jane Smith', '1995-05-15', 'Female', '456 Elm St', '9876543210'),
    ('member3', 'password3', 'member3@example.com', 'Alex Johnson', '1988-08-20', 'Male', '789 Oak St', '5551234567'),
    ('member4', 'password4', 'member4@example.com', 'Valerie Green', '2000-08-20', 'Female', '500 Rust St', '3067829020');

-- Add 6 staff
INSERT INTO Staff (staff_username, password)
VALUES 
    ('adminStaff1', 'password1'),
    ('adminStaff2', 'password2'),
    ('adminStaff3', 'password3'),
    ('adminStaff4', 'password4'),
    ('adminStaff5', 'password5'),
    ('adminStaff6', 'password6');

-- Add 6 trainers
INSERT INTO Trainers (trainer_username, password, email, full_name, date_of_birth, gender, address, phone_number)
VALUES 
    ('trainer1', 'password1', 'trainer1@example.com', 'Karl Miller', '1980-01-15', 'Male', '123 Trainer St', '1111111111'),
    ('trainer2', 'password2', 'trainer2@example.com', 'Lia Finley', '1985-06-20', 'Female', '456 Fitness Ave', '2222222222'),
    ('trainer3', 'password3', 'trainer3@example.com', 'Shawn Cooper', '1978-05-10', 'Male', '789 Workout Blvd', '3333333333'),
    ('trainer4', 'password4', 'trainer4@example.com', 'Carly Grant', '1990-08-30', 'Female', '321 Gym St', '4444444444'),
    ('trainer5', 'password5', 'trainer5@example.com', 'Tiffany Sherlock', '1983-04-25', 'Male', '555 Fitness Rd', '5555555555'),
    ('trainer6', 'password6', 'trainer6@example.com', 'John Brown', '1987-09-05', 'Female', '678 Health Ln', '6666666666');

-- Add 7 equipment maintenance records
INSERT INTO EquipmentMaintenance (equipment_id, equipment_name, cleanliness, quality, previous_checkup, next_checkup)
VALUES 
    (1,'Treadmill', 'Clean', 'Good', '2023-01-15','2025-01-15'),
    (2,'Dumbbells','Dirty', 'Good', '2023-01-15', '2025-01-15'),
    (3,'Exercise Bike','Clean', 'Good', '2024-01-15', '2026-01-15'),
    (4,'Elliptical Trainer', 'Clean', 'Good', '2024-01-15', '2026-01-15'),
    (5,'Rowing Machine','Clean', 'Bad', '2023-01-15', '2025-01-15'),
    (6,'Weight Bench','Dirty', 'Bad','2024-01-15', '2026-01-15'),
    (7,'Resistance Bands','Clean', 'Good', '2023-01-15', '2025-01-15');

-- Add 7 bills
INSERT INTO Bills (bill_id, member_username, member_fullname, details, billing_date, amount, payment_status)
VALUES 
    (1, 'member1','John Doe', 'Training Session','2023-01-01', 200.00, TRUE),
    (2, 'member2','Jane Smith', 'Training Session','2023-01-01', 200.00, TRUE),
    (3, 'member3','Alex Johnson', 'Training Session','2023-01-01', 200.00, TRUE),
    (4, 'member1','John Doe', 'Yoga Class', '2024-01-01', 100.00, FALSE),
    (5, 'member2','Jane Smith', 'Pilates Class','2024-02-01', 100.00, FALSE),
    (6, 'member3','Alex Johnson', 'Pilates Class','2024-02-01', 100.00, FALSE),
    (7, 'member4','Valerie Green', 'Yoga Class','2024-01-01', 100.00, FALSE);
    
-- Add 10 room numbers
INSERT INTO RoomBookings (room_number, available)
VALUES 
    (101, FALSE),
    (102, FALSE),
    (103, TRUE),
    (104, TRUE),
    (105, TRUE),
    (106, TRUE),
    (107, TRUE),
    (108, TRUE),
    (109, TRUE),
    (110, TRUE);

-- Add 5 classes
INSERT INTO Classes (class_id, class_type, class_date, room_number)
VALUES 
    (1,'Yoga', '2023-01-10',101),
    (2, 'Zumba', '2023-01-15', NULL),
    (3, 'Spin', '2023-01-20', NULL),
    (4, 'Pilates', '2023-01-25', 102),
    (5, 'Boxing', '2023-02-01', NULL);
    

-- Add 3 session records
INSERT INTO Sessions (member_username, trainer_username, trainer_name, session_date, start_time, end_time, session_type)
VALUES 
    (NULL, 'trainer1', 'Karl Miller',  '2023-01-15', '10:00am EST', '11:00am EST', 'Personal Training'),
    (NULL, 'trainer2', 'Lia Finley', '2023-01-20', '09:00am EST', '10:00am EST', 'Personal Training'),
    (NULL, 'trainer3', 'Shawn Cooper', '2023-01-25', '08:00am EST', '09:00am EST', 'Personal Training');

-- Add health metrics
INSERT INTO HealthMetrics (member_username, date, weight, height, body_fat_percentage)
VALUES 
    ('member1', '2023-01-01', 75.2, 180, 20.5),
    ('member1', '2023-08-02', 80, 180, 19.0),
    ('member1', '2024-01-03', 85, 180, 17.0),
    ('member2', '2023-01-09', 70.1, 165, 25.0),
    ('member3', '2023-01-01', 80.5, 175, 18.0),
    ('member3', '2024-02-01', 100, 175, 25.0),
    ('member4', '2024-01-01', 100, 170, 25.0),
    ('member4', '2024-02-01', 120, 170, 20.0);
    

-- Add 3 fitness goals
INSERT INTO FitnessGoals (member_username, goal_description, time_interval, achieved)
VALUES 
    ('member1', 'Lose weight', '3 months', TRUE),
    ('member2', 'Build muscle', '6 months', TRUE),
    ('member3', 'Improve flexibility', '1 year', TRUE);

-- Add 3 exercise routines
INSERT INTO ExerciseRoutines (member_username, routines)
VALUES 
    ('member1', 'Cardio 3x/week'),
    ('member2', 'Weight lifting 5x/week'),
    ('member3', 'Stretching daily');

INSERT INTO Monitors (staff_username, equipment_id)
VALUES
    ('adminStaff1', 1),
    ('adminStaff2', 2),
    ('adminStaff1', 3),
    ('adminStaff2', 4),
    ('adminStaff4', 5),
    ('adminStaff4', 6),
    ('adminStaff3', 7);
    

INSERT INTO  Process (staff_username, bill_id)
VALUES
    ('adminStaff1', 1),
    ('adminStaff4', 2),
    ('adminStaff3', 3);


INSERT INTO  Updates (staff_username, class_id)
VALUES
    ('adminStaff3', 1),
    ('adminStaff3', 2),
    ('adminStaff1', 3),
    ('adminStaff4', 4),
    ('adminStaff5', 5);
    

INSERT INTO  Register (class_id,member_username)
VALUES
    (1, 'member1'),
    (2, 'member2'),
    (3, 'member3');

INSERT INTO  Manages (staff_username, room_number)
VALUES
    ('adminStaff1', 101),
    ('adminStaff5', 102),
    ('adminStaff5', 103),
	('adminStaff1', 104),
    ('adminStaff3', 105),
    ('adminStaff3', 106),
	('adminStaff1', 107);

