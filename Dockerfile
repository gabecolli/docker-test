# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR .

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the dependencies
RUN python -m pip install --upgrade pip && \
    python -m venv /venv && \
    /venv/bin/pip install -r /requirements.txt


# Copy the rest of the app to the working directory
COPY . .

# Set the environment variable
ENV FLASK_APP=app.py

# Expose port 80 for the container
EXPOSE 80

# Start the Flask app and activate the virtual environment
CMD ["/venv/Scripts/activate", "flask", "run", "--host", "0.0.0.0", "--port", "80"]


