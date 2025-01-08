-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AIinHealthCareDB
-- -----------------------------------------------------
DROP DATABASE IF EXISTS AIinHealthCareDB; 

CREATE DATABASE IF NOT EXISTS AIinHealthCareDB; 

USE AIinHealthCareDB;
-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `User` (
  `User_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE,
  UNIQUE INDEX `Password_UNIQUE` (`Password` ASC) VISIBLE,
  PRIMARY KEY (`User_ID`),
  UNIQUE INDEX `User_ID_UNIQUE` (`User_ID` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Registered_User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Registered_User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Registered_User` (
  `RegisteredUser_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(255) NULL,
  `Weekly_Schedule` VARCHAR(255) NULL,
  `User_ID` INT NOT NULL,
  UNIQUE INDEX `RegisteredUser_ID_UNIQUE` (`RegisteredUser_ID` ASC),
  CONSTRAINT `FK_Reg_user_ID`
    FOREIGN KEY (`RegisteredUser_ID`)
    REFERENCES `User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Patient` (
  `Patient_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE,
  UNIQUE INDEX `Password_UNIQUE` (`Password` ASC) VISIBLE,
  CONSTRAINT `FK_Patient_User_ID`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `System_Administrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `System_Administrator` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `System_Administrator` (
  `Admin_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  UNIQUE INDEX `User_ID_UNIQUE` (`Admin_ID` ASC),
  CONSTRAINT `FK_Admin_User`
    FOREIGN KEY (`Admin_ID`)
    REFERENCES `User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hospital` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Hospital` (
  `Hospital_ID` INT NOT NULL AUTO_INCREMENT,
  `Hospital_Name` VARCHAR(255) NOT NULL,
  `Hospital_Address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Hospital_ID`),
  UNIQUE INDEX `Hospital_ID_UNIQUE` (`Hospital_ID` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Management`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Management` (
  `Management_ID` INT NOT NULL AUTO_INCREMENT,
  `Hospital_ID` INT NOT NULL,
  `Dept_ID` INT NOT NULL,
  UNIQUE INDEX `Management_ID_UNIQUE` (`Management_ID` ASC) VISIBLE,
  INDEX `Hospital_idx` (`Hospital_ID` ASC) VISIBLE,
  PRIMARY KEY (`Hospital_ID`),
  UNIQUE INDEX `Dept_ID_UNIQUE` (`Dept_ID` ASC) VISIBLE,
  UNIQUE INDEX `Hospital_ID_UNIQUE` (`Hospital_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Hospital`
    FOREIGN KEY (`Hospital_ID`)
    REFERENCES `Hospital` (`Hospital_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Department` (
  `Dept_ID` INT NOT NULL AUTO_INCREMENT,
  `Dept_Location` VARCHAR(255) NOT NULL,
  `Dept_Name` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `Dept_ID_UNIQUE` (`Dept_ID` ASC) VISIBLE,
  UNIQUE INDEX `Dept_Name_UNIQUE` (`Dept_Name` ASC) VISIBLE,
  PRIMARY KEY (`Dept_ID`),
  CONSTRAINT `FK_Management`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `Management` (`Dept_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `AI_Tools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AI_Tools` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `AI_Tools` (
  `Tool_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Tool_Description` VARCHAR(255) NULL,
  `Tool_Name` VARCHAR(255) NULL,
  `Tool_User_ID` INT ZEROFILL NOT NULL,
  UNIQUE INDEX `Tool_User_ID_UNIQUE` (`Tool_User_ID` ASC) VISIBLE,
  PRIMARY KEY (`Tool_ID`),
  UNIQUE INDEX `Tool_ID_UNIQUE` (`Tool_ID` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Researcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Researcher` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Researcher` (
  `Researcher_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `Researcher_ID_UNIQUE` (`Researcher_ID` ASC) VISIBLE,
  INDEX `Role_idx` (`Role` ASC) VISIBLE,
  CONSTRAINT `FK_ResearcherID_RegUser`
    FOREIGN KEY (`Researcher_ID`)
    REFERENCES `Registered_User` (`RegisteredUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Researcher_Role`
    FOREIGN KEY (`Role`)
    REFERENCES `Department` (`Dept_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AI_Tool_Researcher`
    FOREIGN KEY (`Researcher_ID`)
    REFERENCES `AI_Tools` (`Tool_User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Doctor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Doctor` (
  `Doctor_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `Doctor_ID_UNIQUE` (`Doctor_ID` ASC) VISIBLE,
  INDEX `Role_idx` (`Role` ASC) VISIBLE,
  CONSTRAINT `FK_DoctorID_RegUser`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `Registered_User` (`RegisteredUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Doctor_Role`
    FOREIGN KEY (`Role`)
    REFERENCES `Department` (`Dept_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AI_Tool_Doctor`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `AI_Tools` (`Tool_User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nurse` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Nurse` (
  `Nurse_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `Nurse_ID_UNIQUE` (`Nurse_ID` ASC) VISIBLE,
  INDEX `Role_idx` (`Role` ASC) VISIBLE,
  CONSTRAINT `FK_NurseID_RegUser`
    FOREIGN KEY (`Nurse_ID`)
    REFERENCES `Registered_User` (`RegisteredUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Nurse_Role`
    FOREIGN KEY (`Role`)
    REFERENCES `Department` (`Dept_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AI_Tool_Nurse`
    FOREIGN KEY (`Nurse_ID`)
    REFERENCES `AI_Tools` (`Tool_User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Appointments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Appointments` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Appointments` (
  `App_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Patient_ID` INT ZEROFILL NOT NULL,
  `Appointment_History` VARCHAR(255) NULL,
  UNIQUE INDEX `App_ID_UNIQUE` (`App_ID` ASC) VISIBLE,
  PRIMARY KEY (`App_ID`),
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `FK_App_ID`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `Patient` (`Patient_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Staff` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Staff` (
  `Staff_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  UNIQUE INDEX `Staff_ID_UNIQUE` (`Staff_ID` ASC),
  CONSTRAINT `FK_Staff_User_ID`
    FOREIGN KEY (`Staff_ID`)
    REFERENCES `Registered_User` (`RegisteredUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Lab_Test_Information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Lab_Test_Information` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Lab_Test_Information` (
  `Test_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Patient_ID` INT NOT NULL,
  `Test_Result` VARCHAR(255) NULL,
  PRIMARY KEY (`Test_ID`),
  UNIQUE INDEX `Test_ID_UNIQUE` (`Test_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Patient_Test_ID`
    FOREIGN KEY (`Test_ID`)
    REFERENCES `Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Lab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Lab` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Lab` (
  `Lab_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Lab_Location` VARCHAR(255) NULL,
  `Lab_Type` VARCHAR(255) NOT NULL,
  `Test_ID` INT NOT NULL,
  PRIMARY KEY (`Lab_ID`),
  UNIQUE INDEX `Lab_ID_UNIQUE` (`Lab_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Test_Info`
    FOREIGN KEY (`Lab_ID`)
    REFERENCES `Lab_Test_Information` (`Test_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Radiology_Test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Radiology_Test` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Radiology_Test` (
  `Test_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Test_Date` TIMESTAMP NULL,
  `Test_Type` VARCHAR(255) NULL,
  PRIMARY KEY (`Test_ID`),
  UNIQUE INDEX `Test_ID_UNIQUE` (`Test_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Lab_RT`
    FOREIGN KEY (`Test_ID`)
    REFERENCES `Lab` (`Lab_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Blood_Test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Test` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Blood_Test` (
  `Test_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Test_Result` VARCHAR(255) NULL,
  `Test_Name` VARCHAR(255) NULL,
  PRIMARY KEY (`Test_ID`),
  UNIQUE INDEX `Test_ID_UNIQUE` (`Test_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Lab_BT`
    FOREIGN KEY (`Test_ID`)
    REFERENCES `Lab` (`Lab_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Medical_Records`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medical_Records` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Medical_Records` (
  `Record_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Diagnostic_Reports` VARCHAR(255) NULL,
  `Treatment_Plans` VARCHAR(255) NULL,
  `Patient_ID` INT NOT NULL,
  PRIMARY KEY (`Record_ID`),
  UNIQUE INDEX `Record_ID_UNIQUE` (`Record_ID` ASC) VISIBLE,
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Record_ID`
    FOREIGN KEY (`Record_ID`)
    REFERENCES `Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Insurance` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Insurance` (
  `Insurance_ID` INT NOT NULL,
  `Coverage` VARCHAR(255) NULL,
  `Contact_Information` VARCHAR(255) NULL,
  PRIMARY KEY (`Insurance_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Insurance_Registration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Insurance_Registration` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Insurance_Registration` (
  `Registration_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Patient_Information` VARCHAR(255) NULL,
  `Patient_ID` INT NOT NULL,
  PRIMARY KEY (`Registration_ID`),
  INDEX `Insurance_idx` (`Patient_ID` ASC) VISIBLE,
  UNIQUE INDEX `Registration_ID_UNIQUE` (`Registration_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Insurance`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `Insurance` (`Insurance_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Account` (
  `Acc_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Permissions` INT NULL,
  `Acc_Name` VARCHAR(255) NULL,
  PRIMARY KEY (`Acc_ID`),
  UNIQUE INDEX `Acc_ID_UNIQUE` (`Acc_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Acc_ID`
    FOREIGN KEY (`Acc_ID`)
    REFERENCES `User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Insurance_Reg`
    FOREIGN KEY (`Acc_ID`)
    REFERENCES `Insurance_Registration` (`Registration_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Department_Database`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department_Database` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Department_Database` (
  `Session_ID` INT NOT NULL AUTO_INCREMENT,
  `Permissions` INT NOT NULL,
  `Dept_ID` INT NULL,
  PRIMARY KEY (`Session_ID`),
  UNIQUE INDEX `Session_ID_UNIQUE` (`Session_ID` ASC) VISIBLE,
  INDEX `Dept_idx` (`Dept_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Dept_ID`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `Department` (`Dept_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ID_Verification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ID_Verification` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ID_Verification` (
  `Verification_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Is_Verified` TINYINT NOT NULL,
  `Verification_Date` TIMESTAMP NULL,
  PRIMARY KEY (`Verification_ID`),
  UNIQUE INDEX `Verification_ID_UNIQUE` (`Verification_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Verification_ID`
    FOREIGN KEY (`Verification_ID`)
    REFERENCES `User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Medication_Inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medication_Inventory` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Medication_Inventory` (
  `Prod_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Prod_Stock` INT NULL,
  `Prod_Date` TIMESTAMP NULL,
  `Nurse_ID` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`Prod_ID`),
  INDEX `Access_idx` (`Nurse_ID` ASC) VISIBLE,
  UNIQUE INDEX `Nurse_ID_UNIQUE` (`Nurse_ID` ASC) VISIBLE,
  UNIQUE INDEX `Prod_ID_UNIQUE` (`Prod_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Nurse_Access`
    FOREIGN KEY (`Nurse_ID`)
    REFERENCES `Nurse` (`Nurse_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Billing_Management`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Billing_Management` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Billing_Management` (
  `Bill_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Staff_ID` INT NOT NULL,
  `Weekly` VARCHAR(45) NULL,
  PRIMARY KEY (`Bill_ID`),
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Managed_By_Staff`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `Staff` (`Staff_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Billing_Information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Billing_Information` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Billing_Information` (
  `Bill_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Payment_Method` VARCHAR(255) NULL,
  `Bill_Status` TINYINT NULL,
  PRIMARY KEY (`Bill_ID`),
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Bill_ID`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `Patient` (`Patient_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Managed`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `Billing_Management` (`Bill_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Bank_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bank_Account` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Bank_Account` (
  `Billing_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Acc_Number` INT ZEROFILL NOT NULL,
  `Billing_Address` VARCHAR(255) NULL,
  `Acc_Holder_Name` VARCHAR(255) NULL,
  PRIMARY KEY (`Billing_ID`, `Acc_Number`),
  INDEX `Billing_Info_idx` (`Billing_ID` ASC) VISIBLE,
  UNIQUE INDEX `Acc_Number_UNIQUE` (`Acc_Number` ASC) VISIBLE,
  UNIQUE INDEX `Billing_ID_UNIQUE` (`Billing_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Billing_Info`
    FOREIGN KEY (`Billing_ID`)
    REFERENCES `Billing_Information` (`Bill_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `System_Configuration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `System_Configuration` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `System_Configuration` (
  `Setting_ID` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `Setting_Name` VARCHAR(255) NULL,
  `Password` VARCHAR(255) NULL,
  `Admin_User_ID` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`Setting_ID`),
  UNIQUE INDEX `Setting_ID_UNIQUE` (`Setting_ID` ASC) VISIBLE,
  UNIQUE INDEX `Admin_ID_UNIQUE` (`Admin_User_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Config_By_Admin`
    FOREIGN KEY (`Admin_User_ID`)
    REFERENCES `System_Administrator` (`Admin_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permissions` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Permissions` (
  `Permission_ID` INT NOT NULL AUTO_INCREMENT,
  `Permission_Type` VARCHAR(255) NULL,
  `User_Role_ID` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`Permission_ID`),
  INDEX `Perm_ID_idx` (`User_Role_ID` ASC) VISIBLE,
  UNIQUE INDEX `User_Role_ID_UNIQUE` (`User_Role_ID` ASC) VISIBLE,
  UNIQUE INDEX `Permission_ID_UNIQUE` (`Permission_ID` ASC) VISIBLE,
  CONSTRAINT `FK_Perm_ID`
    FOREIGN KEY (`User_Role_ID`)
    REFERENCES `User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
