"""
The code below is just representative of the implementation of a Bot. 
However, this code was not meant to be compiled as it. It is the responsability 
of all the students to modifify this code such that it can fit the 
requirements for this assignments.
"""

import discord
from discord.ext import commands

from database import Database
from models import *

TOKEN = 'MTE3MzQyMDI3OTMzMTAzMzE5OA.G74NOC.tat9qMBeJFZEgszseloNuxejTWGoRzuTqVs0yY'

intents = discord.Intents.all()

bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())


@bot.event
async def on_ready():
  print(f" Bot {bot.user} has joined the room!")
  Database.connect(bot.user)


@bot.command(
    name="test",
    description="write your database business requirement for this command here"
)
async def _test(ctx, arg1):
  testModel = TestModel(ctx, arg1)
  response = testModel.response()
  await ctx.send(response)


# TODO: complete the following tasks:
#       (1) Replace the commands' names with your own commands
#       (2) Write the description of your business requirement in the description parameter
#       (3) Implement your commands' methods.



#  #will not work, need to change the DB instances and I don't have time left

#@bot.command(name="UpcomingAppointments", description="Retrieve a list of patients who have appointments scheduled in the next week, in a specific department. Including details about their appointments and the doctors they are scheduled to see.")
#async def _upcoming_appointments(ctx, department_id: int):
#  appointments = Database.upcoming_appointments(department_id)


@bot.command(name="AIToolsByDepartment", description="Identify total AI tools available for a specific role")
async def _ai_tools_by_department(ctx, role: int):
  total_ai_tools = Database.ai_tools_by_department(role)
  await ctx.send(f"Total AI tools available for role '{role}': {total_ai_tools}")



@bot.command(name="UpdateMedicalRecords", description="Update medical records for patients with radiology tests")
async def _update_medical_records(ctx, patient_id: int, test_type: str, date: str):
  success = Database.update_medical_records(patient_id, test_type, date)
  if success:
      message = f"Medical records updated for Patient ID: {patient_id} with test type: {test_type} on {date}."
  else:
      message = f"Failed to update medical records for Patient ID: {patient_id}."
  await ctx.send(message)


@bot.command(name="UserCountByRole", description="Get registered user list by role (limited to 15)")
async def _user_count_by_role(ctx, role: int):
  user_count = Database.user_count_by_role(role)
  await ctx.send(f"Total registered users with role '{role}': {user_count}")


@bot.command(name="AddPatient", description="Insert patient into database")
async def _add_patient(ctx, patient_id: int, patient_age: int, insurance_id):
  success = Database.add_patient(patient_id, patient_age, insurance_id)
  if success:
      message = f"Patient {patient_id} added successfully."
  else:
      message = f"Failed to add patient {patient_id}."
  await ctx.send(message)



@bot.command(name="UpdateWorkingHours", description="Update weekly schedule for registered users")
async def _update_working_hours(ctx, user_id: int):
  new_hours = "09:00 - 17:00" 
  success = Database.update_working_hours(user_id, new_hours)
  if success:
      message = f"Working hours updated for user {user_id}."
  else:
      message = f"Failed to update working hours for user {user_id}."
  await ctx.send(message)


@bot.command(name="DeleteAppointments", description="Delete appointments for a patient")
async def _delete_appointments(ctx, patient_id: int):
  success = Database.delete_appointments(patient_id)
  if success:
       message = f"Appointments deleted for Patient ID: {patient_id}."
  else:
      message = f"Failed to delete appointments for Patient ID: {patient_id}."
  await ctx.send(message)


@bot.command(name="AbnormalLabTests", description="Retrieve lab tests with abnormal results")
async def _abnormal_lab_tests(ctx, ):
  abnormal_tests = Database.abnormal_lab_tests(test_type)

  if abnormal_tests:
      message = f"Lab tests with abnormal results for '{test_type}':\n"
      for test in abnormal_tests:
          message += f"Test ID: {test_id}, Result: {test_result}\n"
  else:
      message = f"No abnormal lab tests found for '{test_type}'."

  await ctx.send(message)



@bot.command(name="AddAITool", description="Insert new AI tool into the database for a given role")
async def _add_ai_tool(ctx, tool_id: int, tool_name: str, tool_description: str, role: int):
  success = Database.add_ai_tool(tool_id, tool_name, tool_description, role)

  if success:
      message = f"AI tool '{tool_name}' added successfully for User ID: {role}."
  else:
      message = f"Failed to add AI tool '{tool_name}' for User ID: {role}."

  await ctx.send(message)


@bot.command(name="UpdateDepartmentInfo", description="Update department information (Name, Location)")
async def _update_department_info(ctx, department_id: int, new_name: str, new_location: str):
  success = Database.update_department_info(department_id, new_name, new_location)

  if success:
      message = f"Department {department_id} information updated successfully."
  else:
      message = f"Failed to update information for Department {department_id}."

  await ctx.send(message)


#will not work, need to change the DB instances and I don't have time left

#@bot.command(name="UsersInDepartment", description="Get registered user list by role in a specific department")
#async def _users_in_department(ctx, department_id: int):
  #user_list = Database.get_users_in_department(department_id)

  #if user_list:
  #    message = f"Registered users in Department {department_id}:\n"
  #    for user in user_list:
  #      message += f"User ID: {user['user_id']}, Role: {user_role}\n"
  #else:
  #    message = f"No registered users found for Department {department_id}."

  #await ctx.send(message)


@bot.command(name="DiagnosticReport", description="Update patient's medical record diagnostics")
async def _diagnostic_report(ctx, medical_record_id: int, diagnostics: str):
  success = Database.update_diagnostic_report(medical_record_id, diagnostics)

  if success:
      message = f"Diagnostic report updated for Medical Record ID: {medical_record_id}."
  else:
      message = f"Failed to update diagnostic report for Medical Record ID: {medical_record_id}."

  await ctx.send(message)


@bot.command(name="AveragePatientAgeInDept", description="Get average age of patients in a specific department")
async def _average_patient_age_in_dept(ctx, department_id: int):
  average_age = Database.get_average_patient_age_in_dept(department_id)
  await ctx.send(f"Average age of patients in Department {department_id}: {average_age}")

@bot.command(name="MedicationStock", description="Retrieve the medication stock managed by a specific nurse.")
async def _medication_stock(ctx, nurse_id: int):
  medication_stock = Database.medication_stock()

  if medication_stock is not None:
    message = f"Medication stock managed by Nurse {nurse_id}:\n{medication_stock}"
  else:
    message = f"No medication stock found for Nurse {nurse_id}."

  await ctx.send(message)


@bot.command(name="VerifyUserId", description="Verify and update ID verification status for a user.")
async def _verify_user_id(ctx, user_id: int):
    try:
        verified = Database.verify_user_id(user_id)
        if verified:
            message = f"User with ID {user_id} has been successfully verified."
        else:
            message = f"Verification failed for user with ID {user_id}."
    except Exception as e:
        message = f"An error occurred while verifying user ID {user_id}: {str(e)}"

    await ctx.send(message)

bot.run(TOKEN)
