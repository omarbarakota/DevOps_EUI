# the official Python image from the Docker Hub
FROM python:3.9-slim

# the working directory in the container
WORKDIR /workspace

# copy the requirements file into the working dir
COPY requirments.txt .

ENV PYTHONUNBUFFERED=0

# install the dependencies
#Add group and user (App) adjust permissions

RUN pip install --no-cache-dir -r requirments.txt 
#    && addgroup -S app \
#    && adduser -S app -G app \
#    && chown -R app:app . 

# copy the current directory contents into the container at /workspace
COPY . .

# make port 8000 available to the world outside this container
EXPOSE 8000

# define environment variable
ENV FLASK_APP=main.py

#USER app

# run the application 
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "wsgi"]
