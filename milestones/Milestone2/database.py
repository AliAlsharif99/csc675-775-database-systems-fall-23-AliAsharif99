# In this file you must implement your main query methods
# so they can be used by your database models to interact with your bot.

import os

import pymysql.cursors

# note that your remote host where your database is hosted
# must support user permissions to run stored triggers, procedures and functions.
db_host = os.environ["DB_HOST"]
db_username = os.environ["DB_USER"]
db_password = os.environ["DB_PASSWORD"]
db_name = os.environ["DB_NAME"]


class Database:

  @staticmethod
  def connect(bot_name):
    """
        This method creates a connection with your database
        IMPORTANT: all the environment variables must be set correctly
                   before attempting to run this method. Otherwise, it
                   will throw an error message stating that the attempt
                   to connect to your database failed.
        """
    try:
      conn = pymysql.connect(host=db_host,
                             port=3306,
                             user=db_username,
                             password=db_password,
                             db=db_name,
                             charset="utf8mb4",
                             cursorclass=pymysql.cursors.DictCursor)
      print("Bot {} connected to database {}".format(bot_name, db_name))
      return conn
    except ConnectionError as err:
      print(f"An error has occurred: {err.args[1]}")
      print("\n")
      return None

  #TODO: needs to implement the internal logic of all the main query operations
  def get_response(self, query, values=None, fetch=False, many_entities=False):
    """
        query: the SQL query with wildcards (if applicable) to avoid injection attacks
        values: the values passed in the query
        fetch: If set to True, then the method fetches data from the database (i.e with SELECT)
        many_entities: If set to True, the method can insert multiple entities at a time.
        """
    conn = self.connect("CSC675aalsharif")  # Passing bot name while connecting
    if conn:
      try:
        with conn.cursor() as cursor:
          cursor.execute(query, values)
          if fetch:
            if many_entities:
              response = cursor.fetchall()
            else:
              response = cursor.fetchone()
          else:
            conn.commit()
            response = "Query executed successfully"
      except pymysql.Error as e:
        print(f"An error occurred while executing the query: {str(e)}")
        response = None
      finally:
        conn.close()
      return response
    else:
      print("Connection to the database failed.")
      return None

  @staticmethod
  def select(query, values=None, fetch=True):
    database = Database()
    return database.get_response(query, values=values, fetch=fetch)

  @staticmethod
  def insert(query, values=None, many_entities=False):
    database = Database()
    return database.get_response(query,
                                 values=values,
                                 many_entities=many_entities)

  @staticmethod
  def update(query, values=None):
    database = Database()
    return database.get_response(query, values=values)

  @staticmethod
  def delete(query, values=None):
    database = Database()
    return database.get_response(query, values=values)

  @staticmethod
  def upcoming_appointments(department):
    query = "SELECT * FROM Appointments WHERE department = %s AND appointment_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY"
    return Database().select(query, values=(department, ), fetch=True)

  @staticmethod
  def ai_tools_by_department(role):
    query = "SELECT COUNT(*) FROM AI_Tools WHERE role = %s"
    return Database().select(query, values=(role, ), fetch=True)

  @staticmethod
  def update_medical_records(patient_id, test_type, test_date):
    query = "UPDATE MedicalRecords SET test_type = %s, test_date = %s WHERE patient_id = %s"
    return Database().update(query, values=(test_type, test_date, patient_id))

  @staticmethod
  def user_count_by_role(role):
    query = "SELECT COUNT(*) AS user_count FROM Users WHERE role = %s"
    return Database().select(query, values=(role, ), fetch=True)

  @staticmethod
  def add_patient(name, account_id, insurance_id):
    query = "INSERT INTO Patients (name, account_id, insurance_id) VALUES (%s, %s, %s)"
    return Database().insert(query, values=(name, account_id, insurance_id))

  @staticmethod
  def update_working_hours(user_id, new_hours):
    query = "UPDATE WorkingHours SET hours = %s WHERE user_id = %s"
    return Database().update(query, values=(new_hours, user_id))

  @staticmethod
  def delete_appointments(patient_id):
    query = "DELETE FROM Appointments WHERE patient_id = %s"
    return Database().delete(query, values=(patient_id, ))

  @staticmethod
  def abnormal_lab_tests():
    query = """
          SELECT p.name AS patient_name, lt.test_type, d.name AS doctor_name
          FROM LabTests lt
          JOIN Patients p ON lt.patient_id = p.id
          JOIN Doctors d ON lt.doctor_id = d.id
          WHERE lt.test_result = '1'
      """
    return Database().select(query, fetch=True)

  @staticmethod
  def add_ai_tool(tool_id, tool_name, tool_description, user_id):
    query = "INSERT INTO AI_Tools (tool_id, role) VALUES (%s, %s)"
    return Database().insert(query,
                             values=(tool_id, tool_name, tool_description,
                                     user_id))

  @staticmethod
  def update_department_info(department_id, new_name, new_location):
    query = "UPDATE Departments SET name = %s, location = %s WHERE id = %s"
    return Database().update(query,
                             values=(new_name, new_location, department_id))

  @staticmethod
  def get_users_in_department(department_id):
    query = "SELECT name, role FROM Users WHERE department_id = %s"
    return Database().select(query, values=(department_id, ), fetch=True)

  @staticmethod
  def update_diagnostic_report(patient_id, diagnostic_info):
    query = "UPDATE Patients SET diagnostic_report = %s WHERE id = %s"
    return Database().update(query, values=(diagnostic_info, patient_id))

  @staticmethod
  def get_average_patient_age_in_dept(department_id):
    query = "SELECT AVG(age) AS average_age FROM Patients WHERE department_id = %s"
    return Database().select(query, values=(department_id, ), fetch=True)

  @staticmethod
  def medication_stock():
    query = "SELECT m.medication_name, SUM(n.stock) AS total_stock FROM Medications m JOIN Nurses n ON m.id = n.medication_id GROUP BY m.medication_name"
    return Database().select(query, fetch=True)

  #for the id verification, idk how to implement the trigger, i tried different ways but it still doesnt work so i just made it to UPDATE
  @staticmethod
  def verify_user_id(user_id):
    try:
      query = "SELECT VerifyUserId FROM Users WHERE id = %s AND Is_Verified = 'certain_condition'"
      result = Database().select(query, values=(user_id, ))
      if result and result[0]['Is_Verified'] == 1:
        return True
      else:
        return False
    except Exception as e:
      print(f"Error verifying user ID {user_id}: {str(e)}")
      return False
