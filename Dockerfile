# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the dependencies
RUN python -m pip install --upgrade pip && \
    python -m venv /app/venv && \
    /app/venv/bin/pip install -r /app/requirements.txt


# Copy the rest of the app to the working directory
COPY . .

# Set the environment variable
ENV FLASK_APP=app.py

# Expose port 80 for the container
EXPOSE 80

# Start the Flask app and activate the virtual environment
CMD ["/app/venv/bin/python","flask", "run", "--host", "0.0.0.0", "--port", "80"]


