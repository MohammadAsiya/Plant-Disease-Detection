# Use official Python run-time base image with a compatible version for torch 1.8.1 CPU
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for pillow and torch etc
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for Docker cache
COPY Flask\ Deployed\ App/requirements.txt ./requirements.txt

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app source code
COPY Flask\ Deployed\ App/ ./

# Expose the port
EXPOSE 5000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the gunicorn web server
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
