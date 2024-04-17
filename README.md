# GradeBook Docker Setup

This repository provides a Dockerized environment for running a GradeBook application with PostgreSQL as the database backend. Additionally, it includes a script (`GradeBookTasks`) for executing queries on the GradeBook database.

![alt text](https://i.ibb.co/KsVBSWd/Blank-diagram.png)

## Docker Configuration

The `docker-compose.yml` file defines two services:

1. **PostgreSQL**:
   - Image: `postgres:latest`
   - Environment Variables:
     - `POSTGRES_DB`: gradeBook
     - `POSTGRES_USER`: postgres
     - `POSTGRES_PASSWORD`: password
   - Ports: 5432 (mapped to the host)
   - Volume: `postgres_data` (to persist database data)
   - Network: `custom_network`

2. **pgAdmin**:
   - Image: `dpage/pgadmin4`
   - Environment Variables:
     - `PGADMIN_DEFAULT_EMAIL`: sqlspinners@gmail.com
     - `PGADMIN_DEFAULT_PASSWORD`: sqlspinners
   - Ports: 8080 (mapped to the host)
   - Depends On: PostgreSQL service
   - Network: `custom_network`

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/2036saharsha/BenchmarkProject
   
2. Navigate to the cloned directory:

    ```bash
    cd gradebook-docker

3. Run the following command to start the services:

    ```bash
    docker-compose up -d

4. This will create and start the PostgreSQL database and pgAdmin services in the background.

Access pgAdmin at http://localhost:8080 in your web browser. Use the provided email and password to log in.

### GradeBook Database - Running Tasks(queries)
To execute queries on the GradeBook database, use the GradeBookTasks script. Uncomment and run the necessary tasks from the task_files directory. Also, ensure you have a virtual environment created and the required packages installed from requirements.txt.

To run the GradeBook application, follow these steps:

### a. Create a virtual environment:

    python3 -m venv env

### b. Activate the virtual environment:

On Windows:

    .\env\Scripts\activate

On Unix or MacOS:

    source env/bin/activate

c. Install the required packages:

    pip install -r requirements.txt

d. Run the GradeBook application:

    python gradebook.py

## GradeBookTasks Script
The GradeBookTasks script provides functionality to execute queries on the GradeBook database. It includes methods to connect to the database, execute queries with or without results, and perform insert or create operations.

Contributing
If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

License
This project is licensed under the MIT License. Feel free to use and modify it according to your requirements.

Feel free to customize this README to include any additional information specific to your project or environment!