import psycopg2
from psycopg2 import sql

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

    def execute_query(self, query, params=None):
        try:
            cursor = self.connection.cursor()
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            print("Query executed successfully")
        except psycopg2.Error as e:
            self.connection.rollback()  
            print("Error executing query:", e)
        else:
            self.connection.commit()
            print("Transaction committed successfully")
        finally:
            cursor.close()

if __name__ == "__main__":
    postgres = GradeBookTasks(dbname='gradeBook', user='postgres', password='password')
    postgres.connect()

    with open('Task2(CreateTables).sql', 'r') as file:
        commands = file.read().split(';')

    with open('Task2(InsertValues).sql', 'r') as file:
        commands = file.read().split(';')

    for command in commands:
        postgres.execute_query(command)

    postgres.disconnect()
