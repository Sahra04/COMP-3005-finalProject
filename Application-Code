import psycopg2
from psycopg2 import Error

DB_NAME = "db1"  
DB_USER = "postgres"  
DB_PASSWORD = "sahra3005!"
DB_HOST = "localhost"  
DB_PORT = "5432"   

# Function to establish a connection to the PostgreSQL database
def establish_connection():
    try:
        connection = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        print("Connected to the database.")
        return connection
    except Error as e:
        print(f"Error connecting to the database: {e}")
        

#MEMBER FUNCTIONS

#Function for registering User as a Member
def registration(connection, statement, member_username, password, email, full_name, date_of_birth, gender, address, phone_number):
    try:

        sqlCommand = 'SELECT * FROM Members WHERE member_username = %s'
        statement.execute(sqlCommand, (member_username,))
        username_exists = statement.fetchone()

        sqlCommand = 'SELECT * FROM Members WHERE email = %s'
        statement.execute(sqlCommand, (email,))
        email_exists = statement.fetchone()

        #making sure username is unique and error checking it
        if username_exists:
            print("\n Username is NOT Unique, Registration is invalid")
            return False
        #making sure email is unique and error checking it
        elif email_exists: 
            print("\n Email is NOT Unique, Registration is invalid")
            return False
        else: 
            #adding the new member to database
            sqlCommand2 = 'INSERT INTO Members (member_username, password, email, full_name, date_of_birth, gender, address, phone_number) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)'
            row = (member_username, password, email, full_name, date_of_birth, gender, address, phone_number)
            
            statement.execute(sqlCommand2, row) 

            connection.commit()
            print("\n Member added successfully.")
            return True
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"\n Error registering Member: {e}")
    
    
#login in member that already exists in database
def login(statement, member_username, password):
    try:

        sqlCommand = 'SELECT * FROM Members WHERE member_username = %s AND password = %s'
        statement.execute(sqlCommand, (member_username, password))
        valid = statement.fetchone()

        if valid:
            print("Login Successful. ")
            return True
        else: 
            print('Username or Password is incorrect')
            return False

    except Error as e:
        print(f"Error Login in  Member: {e}")

# When member is login, they can add as many health metrics they need according to their needs
def HealthMetric(connection, statement, member_username, date, weight, height, body_fat_percentage): 
    try:
        sqlCommand2 = 'INSERT INTO HealthMetrics (member_username, date, weight, height, body_fat_percentage) VALUES (%s, %s, %s, %s, %s)'
        row = (member_username, date, weight, height, body_fat_percentage)

        statement.execute(sqlCommand2, row) 

        connection.commit()
        print(f"\n Health Metric was successfully recorded")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error registering Member Health Metric: {e}")


# When member is login, they can add as many fitness goals as they need
def FitnessGoal(connection, statement, member_username, goal_description, time_interval, achieved): 
    try:
        sqlCommand = 'INSERT INTO FitnessGoals (member_username, goal_description, time_interval, achieved) VALUES (%s, %s, %s, %s)'
        row = (member_username, goal_description, time_interval, achieved)

        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Fitness Goals was successfully recorded")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error registering Member Fitness Goals: {e}")


# when member is login, they can add as many exercise routines as they need
def ExerciseRoutines(connection, statement, member_username, routines): 
    try:
        sqlCommand = 'INSERT INTO ExerciseRoutines (member_username, routines) VALUES (%s, %s)'
        row = (member_username, routines)

        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Exercise Routines was successfully recorded")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error registering Member Exercise Routines: {e}")


# Allowing members to update personal information on profile
# variables: 
# column: letting member choose the section they want to update
# new_value: replacing the section with their desired value
def ProfileManagement(connection, statement, member_username, column, new_value): 
    try:
        sqlCommand = f'UPDATE Members SET {column} = %s WHERE member_username = %s'
        row = (new_value, member_username)
        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Update was recorded")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Updating Profile: {e}")

#allowing members to update fitness goals if they achieve it
def achieved(connection, statement, member_username, goal_description, new_value): 
    try:
        sqlCommand = 'UPDATE FitnessGoals SET achieved = %s WHERE member_username = %s AND goal_description = %s'
        row = (new_value, member_username, goal_description)
        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Update was recorded for the achieved section")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Updating achieved section: {e}")

#to view memeber exercise routine
def DisplayExerciseRoutines(statement, member_username): 
    try:
        print('\nExercise Routines: \n')
        sqlCommand = 'SELECT routines FROM ExerciseRoutines WHERE member_username = %s'
        statement.execute(sqlCommand, (member_username,)) 
        for record in statement.fetchall():
            print(f'• {record}\n')
    

    except Error as e:
        print(f"Error Displaying Exercise Routines: {e}")

#View Member Fitness Goals
def DisplayFitnessGoals(statement, member_username): 
    try:
        print('\nAchieved Fitness Goals: \n')
        sqlCommand = 'SELECT goal_description FROM FitnessGoals WHERE member_username = %s AND achieved = TRUE'
        statement.execute(sqlCommand, (member_username,)) 
        for record in statement.fetchall():
            print(f'• {record}\n')

    except Error as e:
        print(f"Error Displaying Fitness Goals: {e}")

#View Member Health Statistics     
def DisplayHealthStatistics(statement, member_username): 
    try:
        print('\nHealth Statistics: \n')
        sqlCommand1 = 'SELECT MAX(weight) FROM HealthMetrics WHERE member_username  = %s'
        statement.execute(sqlCommand1, (member_username,)) 
        max_weight = statement.fetchone()[0]
        print(f'Maximum Weight: {max_weight}')

        sqlCommand2 = 'SELECT AVG(weight) FROM HealthMetrics WHERE member_username  = %s'
        statement.execute(sqlCommand2, (member_username,)) 
        average_weight = statement.fetchone()[0]
        print(f'Average Weight: {average_weight}')


        sqlCommand3 = 'SELECT MAX(body_fat_percentage) FROM HealthMetrics WHERE member_username  = %s'
        statement.execute(sqlCommand3, (member_username,)) 
        max_bodyfat = statement.fetchone()[0]
        print(f'Maximum Body Fat Percentage: {max_bodyfat}')


        sqlCommand4 = 'SELECT AVG(body_fat_percentage) FROM HealthMetrics WHERE member_username  = %s'
        statement.execute(sqlCommand4, (member_username,)) 
        average_bodyfat = statement.fetchone()[0]
        print(f'Average Body Fat Percentage: {average_bodyfat}')
  
    except Error as e:
        print(f"Error Displaying Health Statistics: {e}")


#View the Available Training Sessions
def AvailableTrainingSessions(statement): 
    try:
        print('\nSessions that are available: \n')
        sqlCommand = 'SELECT session_id, trainer_name, session_date, start_time, end_time, session_type FROM Sessions WHERE member_username IS NULL'
        statement.execute(sqlCommand) 
        for record in statement.fetchall():
            print(f'• Session ID: {record[0]}, Trainer Name: {record[1]}, Session Date: {record[2]}, Start Time: {record[3]}, End time: {record[4]}, Session Type: {record[5]}\n')

        
    except Error as e:
        print(f"Error with Available Training Sessions: {e}")


#Schedule Training Session
def ScheduleTrainingSession(connection, statement, member_username, session_id): 
    try:
        sqlCommand = 'UPDATE Sessions SET member_username = %s WHERE session_id = %s'
        row = (member_username, session_id)
        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Training Sesssion is Scheduled")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Scheduling Training Session: {e}")

#View Training Session that member schedules
def ViewScheduledTrainingSession(statement, member_username): 
    try:
        print('\nSessions that you are currently Scheduled: \n')
        sqlCommand = 'SELECT session_id, trainer_name, session_date, start_time, end_time, session_type FROM Sessions WHERE member_username = %s'
        statement.execute(sqlCommand, (member_username, )) 
        for record in statement.fetchall():
            print(f'• Session ID: {record[0]}, Trainer Name: {record[1]}, Session Date: {record[2]}, Start Time: {record[3]}, End time: {record[4]}, Session Type: {record[5]}\n')

        
    except Error as e:
        print(f"Error with Viewing Scheduled Training Sessions: {e}")

#Cancel Training Session 
def CancelScheduledTrainingSession(connection, statement, session_id): 
    try:
        sqlCommand = 'UPDATE Sessions SET member_username = NULL WHERE session_id = %s'
        statement.execute(sqlCommand, (session_id,)) 

        connection.commit()
        print(f"\n Training Sesssion is Canceled")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Canceling Training Session: {e}")

#View all Classes available to Register
def ViewClassesToRegister(statement, member_username): 
    try:
        print('\nClasses you can currently register to: \n')
        sqlCommand = 'SELECT * FROM Classes WHERE class_id NOT IN (SELECT class_id FROM REGISTER WHERE member_username = %s);'
        statement.execute(sqlCommand, (member_username, )) 
        for record in statement.fetchall():
            print(f'• Class ID: {record[0]}, Class Type: {record[1]}, Class Date: {record[2]}, Room Number: {record[3]}\n')

        
    except Error as e:
        print(f"Error with Viewing Classes: {e}")

#Allow Member to register     
def RegisterToClasses(connection, statement, member_username, class_id): 
    try:
        sqlCommand = 'INSERT INTO Register (class_id, member_username) VALUES (%s,%s)'
        row = (class_id, member_username)
        statement.execute(sqlCommand, row)
        connection.commit()

        print(f"\n Registered in the group fitness class...")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Registering in the group fitness class...: {e}")

#TRAINER FUNCTIONS

#Allowing Trainer to login
def loginTrainer(statement, trainer_username, password): 
    try:
        sqlCommand = 'SELECT * FROM Trainers WHERE trainer_username = %s AND password = %s'
        statement.execute(sqlCommand, (trainer_username, password))
        valid = statement.fetchone()

        if valid:
            print("\nTrainer Login Successful. \n")
            return True
        else: 
            print('\nUsername or Password is incorrect for Trainer Login\n')
            return False

    except Error as e:
        print(f"Error Login in Trainer: {e}")

#Trainer creating session they are available 
def AddingSession(connection, statement, trainer_username, trainer_name, session_date, start_time, end_time, session_type): 
    try:
        sqlCommand = 'INSERT INTO Sessions (trainer_username, trainer_name, session_date, start_time, end_time, session_type) VALUES (%s,%s,%s,%s,%s,%s)'
        row = (trainer_username, trainer_name, session_date, start_time, end_time, session_type)
        statement.execute(sqlCommand, row)
        connection.commit()
        print(f"\n Trainer added New Session...")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with adding new session...: {e}")

#Letting Trainer View their own sessions they created
def ViewOwnTrainingSessions(statement, trainer_username): 
    try:
        print('\nYour current training sessions: \n')
        sqlCommand = 'SELECT session_id, member_username, trainer_name, session_date, start_time, end_time, session_type FROM Sessions WHERE trainer_username = %s'
        statement.execute(sqlCommand, (trainer_username,)) 
        for record in statement.fetchall():
            print(f'• Session ID: {record[0]}, Member: {record[1]}, Trainer Name: {record[2]}, Session Date: {record[3]}, Start Time: {record[4]}, End time: {record[5]}, Session Type: {record[6]}\n')   
    except Error as e:
        print(f"Error with Viewing Training Sessions: {e}")

#Allowing Trainers to cancel their sessions
def CancelTrainingSessions(connection, statement, session_id):
    try:
        sqlCommand = 'DELETE FROM Sessions WHERE session_id = %s'
        statement.execute(sqlCommand, (session_id,))
        connection.commit()
        print("Trainer Canceled Training Session Successfully")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Trainer Canceling Training Session: {e}")

#Allowing Trainers to Search Member by Name to View Member Profile
def SearchMemberByName(statement, member_name):
    try:
        print('\nView Searched Member Profile: \n')
        sqlCommand = 'SELECT email, full_name, date_of_birth, gender, address, phone_number FROM Members WHERE full_name = %s;'
        statement.execute(sqlCommand, (member_name, )) 
        for record in statement.fetchall():
            print(f'• Email: {record[0]}, Full Name: {record[1]}, Date of Birth: {record[2]}, Gender: {record[3]}, Address: {record[4]},  Phone Number: {record[5]} \n')
    except Error as e:
        print(f"Error with Searching for Member: {e}")

#Administrative Staff Functions: 
#staff login function
def loginAdminStaff(statement, staff_username, password):
    try:
        sqlCommand = 'SELECT * FROM Staff WHERE staff_username = %s AND password = %s'
        statement.execute(sqlCommand, (staff_username, password))
        valid = statement.fetchone()

        if valid:
            print("\nStaff Login Successful. \n")
            return True
        else: 
            print('\nUsername or Password is incorrect for Staff Login\n')
            return False

    except Error as e:
        print(f"Error Login in Staff: {e}")

#allowing staff to view current rooms in database
def ViewRooms(statement): 
    try: 
        print("Current Rooms: \n")
        sqlCommand = 'SELECT * FROM RoomBookings'

        statement.execute(sqlCommand) 

        for record in statement.fetchall():
            print(f'• Room Number: {record[0]}, Available?: {record[1]} \n')

    except Error as e:
        print(f"Error with Viewing Rooms: {e}")

#allowing staff to add rooms 
def addRooms(connection, statement, staff_username, room_number):
    try:
        sqlCommand = 'INSERT INTO RoomBookings (room_number) VALUES (%s)'
        row = (room_number,)
        statement.execute(sqlCommand, row)

        sqlCommand = 'INSERT INTO Manages (staff_username, room_number) VALUES (%s, %s)'
        row = (staff_username, room_number)
        statement.execute(sqlCommand, row)

        connection.commit()
        print(f"\n Room added succesfully...")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with adding Room...: {e}")

#Update if a room is not available or is available function 
def UpdateRoom(connection, statement, staff_username, new_value, room_number): 
    try:
        sqlCommand = 'UPDATE RoomBookings SET available = %s WHERE room_number = %s'
        row = (new_value, room_number)
        statement.execute(sqlCommand, row) 

        sqlCommand = 'UPDATE Manages SET staff_username = %s WHERE room_number = %s'
        row = (staff_username, room_number)
        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Update was recorded for RoomBookings Table and Manages Table")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Updating for Roombookings and Manages Table: {e}")\

#allow to view current equipment in database
def ViewEquipment(statement): 
    try: 
        print("Current Equipment:")
        sqlCommand = 'SELECT * FROM EquipmentMaintenance'

        statement.execute(sqlCommand) 

        for record in statement.fetchall():
            print(f'• Equipment ID: {record[0]}, Equipment name: {record[1]}, previous checkup: {record[2]}, next checkup: {record[3]}, Cleanliness: {record[4]}, Quality: {record[5]} \n')

    except Error as e:
        print(f"Error with Viewing Equipment: {e}")

#allowing staff to edit equipment maintenance table to moniter equipment daily
def EditEquipmentMaintenance(connection, statement, staff_username, equipment_id, column, new_value): 
    try:
        sqlCommand = f'UPDATE EquipmentMaintenance SET {column} = %s WHERE equipment_id = %s'
        row = (new_value, equipment_id)
        statement.execute(sqlCommand, row) 

        sqlCommand = 'UPDATE Monitors SET staff_username = %s WHERE equipment_id = %s'
        row = (staff_username, equipment_id)
        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Update was recorded for Maintenance of Equipment")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Updating Maintenance of Equipment: {e}")
    

#allowing staff to see current class schedule
def ViewCurrentClassSchedule(statement): 
    try: 
        print("Class Schedule: \n")
        sqlCommand = 'SELECT * FROM Classes'

        statement.execute(sqlCommand) 

        for record in statement.fetchall():
            print(f'• Class ID: {record[0]}, Class type: {record[1]}, Class Date: {record[2]}, Room Number: {record[3]} \n')

    except Error as e:
        print(f"Error with Viewing Class Schedule: {e}")

#to add classes to class schedule
def AddClasses(connection, statement, staff_username, class_id, class_type, class_date): 
    try:
        sqlCommand = 'INSERT INTO Classes (class_id, class_type, class_date) VALUES (%s, %s, %s)'
        row = (class_id, class_type, class_date)
        statement.execute(sqlCommand, row)

        sqlCommand = 'INSERT INTO Updates (staff_username, class_id) VALUES (%s, %s)'
        row = (staff_username, class_id)
        statement.execute(sqlCommand, row)

        connection.commit()
        print(f"\n Class added succesfully...")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with adding Class...: {e}")

#to assign a room to a class
def EditClassRoomBooking(connection, statement, staff_username, class_id, new_value): 
    try:
        #updating class schedule table with room number
        sqlCommand = 'UPDATE Classes SET room_number = %s WHERE class_id = %s'
        row = (new_value, class_id)
        statement.execute(sqlCommand, row) 
        
        #updating the Updates Relationship
        sqlCommand = 'UPDATE Updates SET staff_username = %s WHERE class_id = %s'
        row = (staff_username, class_id)
        statement.execute(sqlCommand, row)
        
        #updating the RoomBooking table status for the specific room number that is being assigned to a room
        sqlCommand = 'UPDATE RoomBookings SET available = FALSE WHERE room_number = %s'
        row = (new_value,)
        statement.execute(sqlCommand, row) 

        connection.commit()
        print(f"\n Update was recorded for the Room Number Section for Class Schedule")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Updating Room Number Section for Class Schedule: {e}")

#to delete classes from class schedule
def DeleteClasses(connection, statement, class_id): 
    try:  
        #updating the RoomBooking table status for the specific room number that is assigned to the class that is getting deleted
        sqlCommand1 = 'SELECT room_number FROM Classes WHERE class_id = %s'
        statement.execute(sqlCommand1, (class_id,))
        result = statement.fetchone()

        if result[0] is not None: 
            sqlCommand2 = f'UPDATE RoomBookings SET available = TRUE WHERE room_number = {result[0]}'
            statement.execute(sqlCommand2) 
        
        #deleting the class
        sqlCommand3 = 'DELETE FROM Classes WHERE class_id = %s'
        statement.execute(sqlCommand3, (class_id,))

        connection.commit()
        print("Class Deleted Successfully")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Deleting Class: {e}")

#to search a member by name to see all their bills
def SearchBillsByMemberName(statement, member_name):
    try:
        print('\nView Searched Member Bills: \n')
        sqlCommand = 'SELECT bill_id, member_fullname, details, billing_date, amount, payment_status FROM Bills WHERE member_fullname = %s;'
        statement.execute(sqlCommand, (member_name, )) 
        for record in statement.fetchall():
            print(f'• Bill ID: {record[0]}, Full Name: {record[1]}, Details: {record[2]}, Billing Date: {record[3]}, Amount: {record[4]}, Payment Status: {record[5]} \n')
    except Error as e:
        #printing the type of error
        print(f"Error with Searching for Member Bills: {e}")

#to edit bills status to process them by staff 
def EditStatusOfBill(connection, statement, staff_username, bill_id):
    try:
        #updating Bill status depending on bill_id input
        sqlCommand = 'UPDATE Bills SET payment_status = TRUE WHERE bill_id = %s'
        statement.execute(sqlCommand, (bill_id,)) 
        
        #adding to the Process relationship between Staff Member and Bill
        sqlCommand = 'INSERT INTO Process (staff_username, bill_id) VALUES (%s,%s)'
        row = (staff_username, bill_id)
        statement.execute(sqlCommand, row)

        connection.commit()
        print(f"\n Update was recorded for Bill Status and Process relationship")
    except Error as e:
        #undoing current data change if there is an error 
        connection.rollback()
        #printing the type of error
        print(f"Error with Updating Bill Status and Process relationship: {e}")

#where all Health and Fitness Club Management System functions run
def main():
    

    #establish connection with database
    connection = establish_connection()

    #create cursor object to interact with database
    statement = connection.cursor()
    #seperating user interfaces depending what type of user you are
    print("\nWelcome! Please input the type of user you are from the following choices... :")
    print("1. Member")
    print("2. Trainer")
    print("3. Staff")
    choice = input("Enter your choice (1,2,3): ")


    #Member related functions and Interface
    if choice == "1": 
        while True:
            print("\nLogin/Registration Page For Member:")
            print("1. Registration")
            print("Any input besides '1'. Login")
        
            #Registration or Login choice
            RL_choice = input("Enter your choice (1 or Any other Input): ")
            #to register
            if RL_choice == "1":
                member = input('member username: ')
                if registration(connection, statement, member, input('password: '),input('unique email: '), input('Full Name: '), input('Date of Birth: '), input('Gender (Female, Male, Other): '), input('Address: '), input('Phone Number: ')): 
                    print("\nYou have Finished Registration as a Member, Please return and login using your member username and password \n")
                    continue
                else: 
                    continue
            #to login
            else:
                memberLogin = input('member username: ')
                if (login(statement, memberLogin, input('password: '))): 
                    break
                else: 
                    continue
                
        #When Member login is sucessful, they are welcome accesss to member functions and interface
        while True:
            print("\nWelcome! You have logged in as a MEMBER, you have the following options as a MEMBER:")
            print("1. Input in your Health Metrics")
            print("2. Input in your Fitness Goals")
            print("3. Input in your Exercise Routines")
            print("4. Profile Management: Update Personal Information: ")
            print("5. Change status of fitness goal if achieved")
            print("6. Dashboard Display")
            print("7. View Available Training Sessions")
            print("8. Schedule Training Session and View your Scheduled Training Sessions")
            print("9. Cancel and View your Scheduled Training Sessions")
            print("10. Reschedule Training Session")
            print("11. View Classes You can register to")
            print("12. Register to Classes")
            print("Any other input. LOG OUT/EXIT")



            member_choice = input('\ntype in you choice (1,2,3,4,5,6,7,8,9,10,11,12,Any Other Input): ')
            if member_choice == "1": 
                print("\nWelcome to the Health Metrics Section! Please fill in the following for your health metrics: \n")
                while True: 
                    HealthMetric(connection, statement, memberLogin, input('date: '), input('weight (pounds): '), input('height (cm): '), input('body fat percentage (%): '))
                    result1 = input(f'\nWould you like to add more Health Metrics. Type "yes" or "no": \n')
                    if result1 == "yes": 
                        continue
                    else: 
                        print("\nExiting from Health Metric section...: \n")
                        break 
                continue
            elif member_choice == "2": 
                print("\nWelcome to the Fitness Goal Section! Please fill in the following for Fitness Goals: \n")
                while True: 
                    FitnessGoal(connection, statement, memberLogin, input('goal description: '), input('time interval: '), input('goal achieved? (TYPE: TRUE/FALSE): '))
                    result1 = input(f'\nWould you like to add more Fitness Goals. Type "yes" or "no": \n')
                    if result1 == "yes": 
                        continue
                    else: 
                        print("\nExiting from Fitness Goal section...: \n")
                        break
                continue 
            elif member_choice == "3": 
                print("\nWelcome to the Exercise Routine Section! Please fill in the following for your Exercise Routines: \n")
                while True: 
                    ExerciseRoutines(connection, statement, memberLogin, input('\nType of Exercise: '))
                    result2 = input(f'\nWould you like to add more Excercise routines. Type "yes" or "no": \n')
                    if result2 == "yes": 
                        continue
                    else: 
                        print("\nExiting from exercise routines section...: \n")
                        break 
                continue 
            elif member_choice == "4":
                print("\nWelcome to editing your personal information! Please fill in the following: \n")
                ProfileManagement(connection, statement, memberLogin, input('\nSection you want to update: '), input('\nNew Value you want to replace with: '))
                continue
            elif member_choice == "5":
                print("\nWelcome to editing status of your fitness goals! Please change the status in the following: \n")
                achieved(connection, statement, memberLogin, input('\nInput the Goal you want to change status of: '), input('\nInput either "TRUE" or "FALSE" for changing status: '))
                continue
            elif member_choice == "6":
                print("\nWelcome to DASHBOARD!\n")
                DisplayExerciseRoutines(statement, memberLogin)
                print("\n")
                DisplayFitnessGoals(statement, memberLogin)
                print("\n")
                DisplayHealthStatistics(statement, memberLogin)
            elif member_choice == "7":
                AvailableTrainingSessions(statement)
            elif member_choice == "8": 
                print("\nIn the following, Input the Session ID, for the Session you want to Schedule: \n")
                ScheduleTrainingSession(connection, statement, memberLogin, int(input("Session ID: ")))
                ViewScheduledTrainingSession(statement, memberLogin)
            elif member_choice == "9":
                CancelScheduledTrainingSession(connection, statement, input("Input the Session ID of the Session you want to cancel: "))
                ViewScheduledTrainingSession(statement, memberLogin)
            elif member_choice == "10":
                ViewScheduledTrainingSession(statement, memberLogin)
                print("\nCancel Training Session you want to reschedule: \n")
                CancelScheduledTrainingSession(connection, statement, input("Input the Session ID of the Session you want to cancel: "))
                print("\nReschedule Training Session according to the ones available: \n")
                AvailableTrainingSessions(statement)
                ScheduleTrainingSession(connection, statement, memberLogin, int(input("Input the Session ID of your new Session: ")))
                print("\nSession has been rescheduled... \n")
            elif member_choice == "11": 
                ViewClassesToRegister(statement, memberLogin)
            elif  member_choice == "12": 
                RegisterToClasses(connection, statement, memberLogin, int(input("Input the Class ID that you want to register to: ")))
            else: 
                print("logging out and exiting from member interface...")
                break

    if choice == "2":
        print("\nLogin Section For Trainers: " )
        while True: 
            TrainerLogin = input("Input your username: ") 
            if loginTrainer(statement, TrainerLogin, input("Input your password: ")): 
                break
            else: 
                continue
        #When Trainer login is sucessful, they are welcome access to trainer functions and interface
        while True: 
            print("\nWelcome! You have logged in as a TRAINER, you have the following options as a TRAINER:")
            print("1. Post a Training Session in which you are available: ")
            print("2. View Current Training Sessions from all Trainers: ")
            print("3. Cancel a Training Session: ")
            print("4. Search Member by Name and View their profile: ")
            print("Any other Input. LOG-OUT/EXIT: ")
            

            trainer_choice = input('\ntype in you choice (1,2,3,4,Any Other Input): ')
            if trainer_choice == "1":
                AddingSession(connection, statement, TrainerLogin, input("Type in your name: "), input("Type in the date you want the seesion: "), input("Type in the time you want to start the session: "), input("Type in the time you want to end the session: "), input("Type in the type of session: "))
            elif trainer_choice == "2" :
               ViewOwnTrainingSessions(statement, TrainerLogin) 
            elif trainer_choice == "3" :
                CancelTrainingSessions(connection, statement, input("\nSession ID: "))
            elif trainer_choice == "4": 
                SearchMemberByName(statement, input("\nSearch by Member Full Name: "))
            else:
                print("exiting and logging out from trainer interface...")
                break
            
    if choice == "3": 
        print("\nLogin Section For Administrative Staff: " )
        while True: 
            StaffLogin = input("Input your username: ") 
            if loginAdminStaff(statement, StaffLogin, input("Input your password: ")): 
                break
            else: 
                continue
        #When Staff login is sucessful, they are welcome access to staff functions and interface
        while True: 
            print("\nWelcome! You have logged in as a STAFF member, you have the following options as a STAFF member:")
            print("0. View Rooms ")
            print("1. Add a Room ")
            print("2. Edit the Availability of Rooms ")
            print("3. View Equipment Maintenance ")
            print("4. Edit Maintenance of Equipment ")
            print("5. View Current Class Schedule")
            print("6. Add Classes ")
            print("7. Assign a class to a room ")
            print("8. Delete Classes ")
            print("9. View Bills of Specific Member by Full Name ")
            print("10. Edit status of bill ")
            print("Any other Input. LOGOUT AND EXIT ")


            staff_choice = input('\ntype in you choice (0,1,2,3,4,5,6,7,8,9,10,Any Other Input): ')
            if staff_choice == "0": 
                ViewRooms(statement)
            elif staff_choice == "1": 
                addRooms(connection, statement, StaffLogin, input("Input the new room number you want to add: "))
            elif staff_choice == "2": 
                UpdateRoom(connection, statement, StaffLogin, input("Input the availability of the room (TRUE/FALSE): "), input("Input the room number you want to edit the availability of: "))
            elif staff_choice == "3": 
                ViewEquipment(statement)
            elif staff_choice == "4": 
                EditEquipmentMaintenance(connection, statement, StaffLogin, input("Input the Equipment ID of the equipment you want to update: "), input("Specific section you want updated: "), input("Input the new value you want it to be replaced with: "))
            elif staff_choice == "5": 
                ViewCurrentClassSchedule(statement)
            elif staff_choice == "6": 
                AddClasses(connection, statement, StaffLogin, input("Input unique Class ID: "), input("Input unique Class Type: "), input("Input Class Date: "))
            elif staff_choice == "7": 
                EditClassRoomBooking(connection, statement, StaffLogin, input("Input Class ID of class you want to assign a room to: "), int(input("Enter the room number that is being assigned: ")))
            elif staff_choice == "8": 
                DeleteClasses(connection, statement, input("Input Class ID of class you want to delete from the Class Schedule: "))
            elif staff_choice == "9": 
                SearchBillsByMemberName(statement, input("Input Member's Full Name to see their Bills: "))
            elif staff_choice == "10": 
                EditStatusOfBill(connection, statement, StaffLogin, input("Input Bill ID you want to process: "))
            else: 
                print("exiting and logging out from staff interface...")
                break
                
main()
       






