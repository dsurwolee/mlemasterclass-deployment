# This line specifies the base image for the Docker image. 
# It uses the image tiangolo/uvicorn-gunicorn-fastapi:python3.10, 
# which is a pre-built image that includes Python 3.10, Uvicorn, Gunicorn, and FastAPI.
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

# This line copies the content of the current directory (where the Dockerfile resides) 
# to the /app directory inside the container.
COPY ./app /app

# This line copies the requirements.txt file from the current 
# directory to the /app directory inside the container.
COPY requirements.txt requirements.txt

# This line installs the Python dependencies specified in the requirements.txt file 
# inside the container using the pip package manager.
RUN pip install -r requirements.txt