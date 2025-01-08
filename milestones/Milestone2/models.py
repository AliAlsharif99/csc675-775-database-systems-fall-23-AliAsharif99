"""
In this file you must implement all your database models.
If you need to use the methods from your database.py call them
statically. For instance:
       # opens a new connection to your database
       connection = Database.connect()
       # closes the previous connection to avoid memory leaks
       connection.close()
"""

from database import Database


class TestModel:
  """
    This is an object model example. Note that
    this model doesn't implement a DB connection.
    """

  def __init__(self, ctx):
    self.ctx = ctx
    self.author = ctx.message.author.name

  def response(self):
    return f'Hi, {self.author}. I am alive'


class User:
  def __init__(self, User_ID, Username, Password):
    self.User_ID = User_ID
    self.Username = Username
    self.Password = Password
      
class RegisteredUser:
  def __init__(self, RegisteredUser_ID, Role, Weekly_Schedule, User_ID):
    self.RegisteredUser_ID = RegisteredUser_ID
    self.Role = Role
    self.Weekly_Schedule = Weekly_Schedule
    self.User_ID = User_ID
      
class Patient:
  def __init__(self, Patient_ID, Username, Password, Patient_Age):
    self.Patient_ID = Patient_ID
    self.Username = Username
    self.Password = Password
    self.Patient_Age = Patient_Age

class SystemAdministrator:
  def __init__(self, Admin_ID):
    self.Admin_ID = Admin_ID
      
class Hospital:
  def __init__(self, Hospital_ID, Hospital_Name, Hospital_Address):
    self.Hospital_ID = Hospital_ID
    self.Hospital_Name = Hospital_Name
    self.Hospital_Address = Hospital_Address
      
class Management:
  def __init__(self, Management_ID, Hospital_ID, Dept_ID):
    self.Management_ID = Management_ID
    self.Hospital_ID = Hospital_ID
    self.Dept_ID = Dept_ID
      
class Department:
  def __init__(self, Dept_ID, Dept_Location, Dept_Name):
    self.Dept_ID = Dept_ID
    self.Dept_Location = Dept_Location
    self.Dept_Name = Dept_Name
      
class AITools:
  def __init__(self, Tool_ID, Tool_Description, Tool_Name, Tool_User_ID):
    self.Tool_ID = Tool_ID
    self.Tool_Description = Tool_Description
    self.Tool_Name = Tool_Name
    self.Tool_User_ID = Tool_User_ID
      
class Researcher:
  def __init__(self, Researcher_ID, Role):
    self.Researcher_ID = Researcher_ID
    self.Role = Role
      
class Doctor:
  def __init__(self, Doctor_ID, Role):
    self.Doctor_ID = Doctor_ID
    self.Role = Role
      
class Nurse:
  def __init__(self, Nurse_ID, Role):
    self.Nurse_ID = Nurse_I
    self.Role = Role
      
class Appointments:
  def __init__(self, App_ID, Patient_ID, Appointment_History):
    self.App_ID = App_ID
    self.Patient_ID = Patient_ID
    self.Appointment_History = Appointment_History
      
class Staff:
  def __init__(self, Staff_ID):
    self.Staff_ID = Staff_ID
      
class LabTestInformation:
  def __init__(self, Test_ID, Patient_ID, Test_Result):
    self.Test_ID = Test_ID
    self.Patient_ID = Patient_ID
    self.Test_Result = Test_Result

class Lab:
  def __init__(self, Lab_ID, Lab_Location, Lab_Type, Test_ID):
    self.Lab_ID = Lab_ID
    self.Lab_Location = Lab_Location
    self.Lab_Type = Lab_Type
    self.Test_ID = Test_ID

class RadiologyTest:
  def __init__(self, Test_ID, Test_Date, Test_Type, Test_Status):
    self.Test_ID = Test_ID
    self.Test_Date = Test_Date
    self.Test_Type = Test_Type
    self.Test_Status = Test_Status

class BloodTest:
  def __init__(self, Test_ID, Test_Result, Test_Name, Test_Status):
    self.Test_ID = Test_ID
    self.Test_Result = Test_Result
    self.Test_Name = Test_Name
    self.Test_Status = Test_Status

class MedicalRecords:
  def __init__(self, Record_ID, Diagnostic_Reports, Treatment_Plans, Patient_ID):
    self.Record_ID = Record_ID
    self.Diagnostic_Reports = Diagnostic_Reports
    self.Treatment_Plans = Treatment_Plans
    self.Patient_ID = Patient_ID

class Insurance:
  def __init__(self, Insurance_ID, Coverage, Contact_Information):
    self.Insurance_ID = Insurance_ID
    self.Coverage = Coverage
    self.Contact_Information = Contact_Information

class InsuranceRegistration:
  def __init__(self, Registration_ID, Patient_Information, Patient_ID):
    self.Registration_ID = Registration_ID
    self.Patient_Information = Patient_Information
    self.Patient_ID = Patient_ID

class Account:
  def __init__(self, Acc_ID, Permissions, Acc_Name):
    self.Acc_ID = Acc_ID
    self.Permissions = Permissions
    self.Acc_Name = Acc_Name

class DepartmentDatabase:
  def __init__(self, Session_ID, Permissions, Dept_ID):
    self.Session_ID = Session_ID
    self.Permissions = Permissions
    self.Dept_ID = Dept_ID

class IDVerification:
  def __init__(self, Verification_ID, Is_Verified, Verification_Date):
    self.Verification_ID = Verification_ID
    self.Is_Verified = Is_Verified
    self.Verification_Date = Verification_Date

class MedicationInventory:
  def __init__(self, Prod_ID, Prod_Stock, Prod_Date, Nurse_ID):
    self.Prod_ID = Prod_ID
    self.Prod_Stock = Prod_Stock
    self.Prod_Date = Prod_Date
    self.Nurse_ID = Nurse_ID

class BillingManagement:
  def __init__(self, Bill_ID, Staff_ID, Weekly):
    self.Bill_ID = Bill_ID
    self.Staff_ID = Staff_ID
    self.Weekly = Weekly

class BillingInformation:
  def __init__(self, Bill_ID, Payment_Method, Bill_Status):
    self.Bill_ID = Bill_ID
    self.Payment_Method = Payment_Method
    self.Bill_Status = Bill_Status

class BankAccount:
  def __init__(self, Acc_Number, Billing_Address, Acc_Holder_Name, Billing_ID):
    self.Acc_Number = Acc_Number
    self.Billing_Address = Billing_Address
    self.Acc_Holder_Name = Acc_Holder_Name
    self.Billing_ID = Billing_ID

class SystemConfiguration:
  def __init__(self, Setting_ID, Setting_Name, Password, Admin_User_ID):
    self.Setting_ID = Setting_ID
    self.Setting_Name = Setting_Name
    self.Password = Password
    self.Admin_User_ID = Admin_User_ID

class Permissions:
  def __init__(self, Permission_ID, Permission_Type, User_Role_ID):
    self.Permission_ID = Permission_ID
    self.Permission_Type = Permission_Type
    self.User_Role_ID = User_Role_ID
