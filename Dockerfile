# Use the official Python image from the Docker Hub
FROM python:3.10-alpine

# Set environment variables to prevent Python from buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code into the container
COPY . /app/

# Expose port 8000 (default for Django)
EXPOSE 8000

# Run Django's development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
# CMD ["python", "manage.py", "runserver"]

# docker build -t django-app-py3.10:0.0.1 .
