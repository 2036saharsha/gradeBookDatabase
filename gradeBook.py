import psycopg2, time

class GradeBookTasks:
    def __init__(self, dbname, user, password, host='localhost', port=5432):
        self.dbname = dbname
        self.user = user
        self.password = password
        self.host = host
        self.port = port
        self.connection = None

    def connect(self):
        try:
            self.connection = psycopg2.connect(
                dbname=self.dbname,
                user=self.user,
                password=self.password,
                host=self.host,
                port=self.port
            )
            self.connection.autocommit = False
            print("Connected to PostgreSQL")
        except psycopg2.Error as e:
            print("Error connecting to PostgreSQL:", e)

    def disconnect(self):
        if self.connection:
            self.connection.close()
            print("Disconnected from PostgreSQL")

    def execute_query_with_result(self, query, params=None):
        try:
            cursor = self.connection.cursor()
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            result = cursor.fetchall()
            print(result) 
        except psycopg2.Error as e:
            self.connection.rollback()  
            print("Error executing query:", e)
            return None
        finally:
            cursor.close()

    def execute_insert_or_create(self, query, params=None):
        try:
            cursor = self.connection.cursor()
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            print("Operation done successfully")
        except psycopg2.Error as e:
            self.connection.rollback()  
            print("Error executing operation:", e)
        else:
            self.connection.commit()
            print("Transaction committed successfully")
        finally:
            cursor.close()

def perform_query(task_name, postgres):
    with open(task_name, 'r') as file:
        commands = file.read().split(';')
        
    execute_func = (
        postgres.execute_insert_or_create 
        if "CreateTables" in task_name or "InsertValues" in task_name or "UpdateValues" in task_name
        else postgres.execute_query_with_result
    )
    
    for command in commands:
        execute_func(command)

if __name__ == "__main__":
    postgres = GradeBookTasks(dbname='gradeBook', user='postgres', password='password')
    postgres.connect()
    task_files = {
        # "DeleteTables(CreateTables).sql",
        # "Task2(CreateTables).sql",
        # "Task2(InsertValues).sql",
        "Task10.sql",
        # "Task7.sql",
    }
    for taskName in task_files:
        perform_query(taskName, postgres)

    postgres.disconnect()
