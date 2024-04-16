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
        result = None
        try:
            with self.connection.cursor() as cursor:
                if params:
                    cursor.execute(query, params)
                else:
                    cursor.execute(query)
                # print("Query executed successfully")
                result = cursor.fetchall() 
        except psycopg2.Error as e:
            self.connection.rollback()  
            print("Error executing query:", e)
        else:
            self.connection.commit()
            # print("Transaction committed successfully")
        return result

    def format_result(self, result):
        if result:
            formatted_results = []
            for row in result:
                formatted_row = ', '.join(str(value) for value in row)
                formatted_results.append(formatted_row)
            return formatted_results
        else:
            return "No results found."

    def execute_queries(self, file):
        with open(file, 'r') as f:
            queries = f.read().split(';')
        
        for query in queries:
            if query.strip():
                result = self.execute_query(query)
                formatted_result = self.format_result(result)
                print("Result:", formatted_result)

if __name__ == "__main__":
    postgres = GradeBookTasks(dbname='gradeBook', user='postgres', password='password')
    postgres.connect()

    create_insert_file = 'create_insert.sql'
    query_file = 'Task4.sql'

    # postgres.execute_queries(create_insert_file)
    postgres.execute_queries(query_file)

    postgres.disconnect()
