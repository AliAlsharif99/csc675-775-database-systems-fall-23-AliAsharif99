-- Script name: inserts.sql
-- Author: Ali Alsharif
-- Purpose: Insert sample data to test the integrity of this database system

-- Set the database used to insert the data into.
USE AIinHealthCareDB;

-- Sample Data Inserts
-- User table inserts
INSERT INTO `User` (`Username`, `Password`) VALUES
('user1', 'password1'),
('user2', 'password2'),
('user3', 'password3');

-- Registered_User table inserts
INSERT INTO `Registered_User` (`Role`, `Weekly_Schedule`, `User_ID`) VALUES
('Admin', 'Monday', 1),
('User', 'Tuesday', 2),
('Admin', 'Wednesday', 3);

-- Patient table inserts
INSERT INTO `Patient` (`Username`, `Password`) VALUES
('patient1', 'password1'),
('patient2', 'password2'),
('patient3', 'password3');

-- System_Administrator table inserts
INSERT INTO `System_Administrator` (`Admin_ID`) VALUES
(1),
(2),
(3);

-- Hospital table inserts
INSERT INTO `Hospital` (`Hospital_Name`, `Hospital_Address`) VALUES
('Hospital A', '123 Main St'),
('Hospital B', '456 Elm St'),
('Hospital C', '789 Oak St');

-- Management table inserts
INSERT INTO `Management` (`Hospital_ID`, `Dept_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Department table inserts
INSERT INTO `Department` (`Dept_Location`, `Dept_Name`) VALUES
('Dept A Location', 'Dept A'),
('Dept B Location', 'Dept B'),
('Dept C Location', 'Dept C');

-- AI_Tools table inserts
INSERT INTO `AI_Tools` (`Tool_Description`, `Tool_Name`, `Tool_User_ID`) VALUES
('Tool A Description', 'Tool A', 1),
('Tool B Description', 'Tool B', 2),
('Tool C Description', 'Tool C', 3);

-- Researcher table inserts
INSERT INTO `Researcher` (`Role`) VALUES
('Dept A'),
('Dept B'),
('Dept C');

-- Doctor table inserts
INSERT INTO `Doctor` (`Role`) VALUES
('Dept A'),
('Dept B'),
('Dept C');

-- Nurse table inserts
INSERT INTO `Nurse` (`Role`) VALUES
('Dept A'),
('Dept B'),
('Dept C');

-- Appointments table inserts
INSERT INTO `Appointments` (`Patient_ID`, `Appointment_History`) VALUES
(1, 'History for Patient 1'),
(2, 'History for Patient 2'),
(3, 'History for Patient 3');


-- Staff table inserts
INSERT INTO `Staff` (`Staff_ID`) VALUES
(1),
(2),
(3);

-- Lab_Test_Information table inserts
INSERT INTO `Lab_Test_Information` (`Patient_ID`, `Test_Result`) VALUES
(1, 'Test result for Patient 1'),
(2, 'Test result for Patient 2'),
(3, 'Test result for Patient 3');

-- Lab table inserts
INSERT INTO `Lab` (`Lab_Location`, `Lab_Type`, `Test_ID`) VALUES
('Lab A Location', 'Type A', 1),
('Lab B Location', 'Type B', 2),
('Lab C Location', 'Type C', 3);

-- Radiology_Test table inserts
INSERT INTO `Radiology_Test` (`Test_Date`, `Test_Type`, `Test_ID`) VALUES
('2023-10-25 08:00:00', 'X-Ray', 1),
('2023-10-26 09:15:00', 'MRI', 2),
('2023-10-27 10:30:00', 'CT Scan', 3);

-- Blood_Test table inserts
INSERT INTO `Blood_Test` (`Test_Result`, `Test_Name`, `Test_ID`) VALUES
('Blood test result 1', 'Test 1', 1),
('Blood test result 2', 'Test 2', 2),
('Blood test result 3', 'Test 3', 3);

-- Medical_Records table inserts
INSERT INTO `Medical_Records` (`Diagnostic_Reports`, `Treatment_Plans`, `Patient_ID`) VALUES
('Report for Patient 1', 'Treatment plan for Patient 1', 1),
('Report for Patient 2', 'Treatment plan for Patient 2', 2),
('Report for Patient 3', 'Treatment plan for Patient 3', 3);

-- Insurance table inserts
INSERT INTO `Insurance` (`Insurance_ID`, `Coverage`, `Contact_Information`) VALUES
(1, 'Coverage A', 'Contact A'),
(2, 'Coverage B', 'Contact B'),
(3, 'Coverage C', 'Contact C');

-- Insurance_Registration table inserts
INSERT INTO `Insurance_Registration` (`Patient_Information`, `Patient_ID`) VALUES
('Patient Info 1', 1),
('Patient Info 2', 2),
('Patient Info 3', 3);

-- Account table inserts
INSERT INTO `Account` (`Permissions`, `Acc_Name`) VALUES
(1, 'Account 1'),
(2, 'Account 2'),
(3, 'Account 3');

-- Department_Database table inserts
INSERT INTO `Department_Database` (`Permissions`, `Dept_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- ID_Verification table inserts
INSERT INTO `ID_Verification` (`Is_Verified`, `Verification_Date`) VALUES
(1, '2023-10-25 08:00:00'),
(0, '2023-10-26 09:15:00'),
(1, '2023-10-27 10:30:00');

-- Medication_Inventory table inserts
INSERT INTO `Medication_Inventory` (`Prod_Stock`, `Prod_Date`, `Nurse_ID`) VALUES
(10, '2023-10-25 08:00:00', 1),
(15, '2023-10-26 09:15:00', 2),
(20, '2023-10-27 10:30:00', 3);

-- Billing_Management table inserts
INSERT INTO `Billing_Management` (`Staff_ID`, `Weekly`) VALUES
(1, 'Week 1'),
(2, 'Week 2'),
(3, 'Week 3');

-- Billing_Information table inserts
INSERT INTO `Billing_Information` (`Payment_Method`, `Bill_Status`, `Bill_ID`) VALUES
('Credit Card', 1, 1),
('PayPal', 0, 2),
('Cash', 1, 3);

-- Bank_Account table inserts
INSERT INTO `Bank_Account` (`Acc_Number`, `Billing_Address`, `Acc_Holder_Name`, `Billing_ID`) VALUES
(123456, 'Billing Address 1', 'Holder Name 1', 1),
(654321, 'Billing Address 2', 'Holder Name 2', 2),
(987654, 'Billing Address 3', 'Holder Name 3', 3);

-- System_Configuration table inserts
INSERT INTO `System_Configuration` (`Setting_Name`, `Password`, `Admin_User_ID`) VALUES
('Setting 1', 'Password 1', 1),
('Setting 2', 'Password 2', 2),
('Setting 3', 'Password 3', 3);

-- Permissions table inserts
INSERT INTO `Permissions` (`Permission_Type`, `User_Role_ID`) VALUES
('Type A', 1),
('Type B', 2),
('Type C', 3);
