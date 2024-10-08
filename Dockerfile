# the official Python image from the Docker Hub
FROM python:3.9-slim

# the working directory in the container
WORKDIR /workspace

# copy the requirements file into the working dir
COPY requirments.txt .

# install the dependencies
RUN pip install --no-cache-dir -r requirments.txt


# copy the current directory contents into the container at /workspace
COPY . .

# make port 8080 available to the world outside this container
EXPOSE 8080

# define environment variable
ENV FLASK_APP=main.py

# run the application 
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "wsgi"]
