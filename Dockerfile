# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Create and activate the virtual environment
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Install the dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the rest of the app to the working directory
COPY . .

# Expose port 80 for the container
EXPOSE 80

ENV FLASK_APP=app.py

# Start the Flask app
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "80"]


