# FastAPI Docker Setup

This repository provides a basic setup for creating and running a FastAPI application within a Docker container. Follow
the instructions below to get started.

## Prerequisites

Before you start, make sure you have the following installed on your system:

- [Python 3.7+](https://www.python.org/downloads/)
- [Docker](https://www.docker.com/products/docker-desktop) (including Docker Compose if needed)

## Installation

### 1. Install FastAPI

To install FastAPI and its dependencies, follow these steps:

1. **Create a Virtual Environment (Optional but recommended)**

   ```bash
   python -m venv venv

2. **Activate the Virtual Environment On Windows**
   ```bash
   .\venv\Scripts\activate

3. **Install FastAPI and Uvicorn**

FastAPI is the web framework, and Uvicorn is the ASGI server used to run the FastAPI application.

    pip install fastapi uvicorn

### 2. Create a FastAPI Application
Create a new file named main.py with the following content:

```bash
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}
```
This simple FastAPI application returns a JSON response {"Hello": "World"} when you access the root URL.

### 3. Create a Dockerfile

```bash
# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install FastAPI and Uvicorn inside the container
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose port 8000 to the outside world
EXPOSE 8000

# Define the command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```
### 4. Create a requirements.txt file
```bash
pip freeze > requirements.txt
```

### 5. Build the Docker Image
In the root directory of your project, run the following command to build the Docker image:
   ```bash
   docker build -t my-fastapi-app .
   ```
### 6. Run the Docker Container
Once the image is built, you can run a container from it with the following command:
```bash
docker run -d -p 8000:8000 my-fastapi-app
```
This command runs the container in detached mode (-d), maps port 8000 on your host to port 8000 in the container, and uses the my-fastapi-app image.

### 7. Access the Application
You can now access the FastAPI application by navigating to http://localhost:8000 in your web browser.

To view the interactive API documentation provided by FastAPI, go to http://localhost:8000/docs.

# Pushing Docker Image to Docker Hub.

1. **Tag Docker Image.**
```bash
docker tag <local-image>:<tag> <username>/<repository>:<tag>

# Check if docker is loggedIn. 
docker login

# Login workaround if not working with personal access token.
docker login -u your-username --password your-token

# Login workaround if not working with personal access token.
docker push <username>/<repository>:<tag>

# Pull docker image from docker hub repositories
docker pull <username>/<repository>:<tag>

# Run docker container 
docker run -d -p 8000:8000 --name my-running-app <username>/<repository>:<tag>

# Verify container is running
docker ps

# Access the Application: http://localhost:8000

#Stop and Remove the Container
- docker stop my-running-app
- docker rm my-running-app

# Remove docker image
docker rmi <username>/<repository>:<tag>
```

# Additional Resources
- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf)
- [Bash Command-Line Cheat Sheet](https://cheatography.com/chaosjd/cheat-sheets/batch/)

Feel free to modify the FastAPI application and Docker configuration as needed for your specific use case.