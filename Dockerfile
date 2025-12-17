# Use official Python image as base
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 libsm6 libxrender1 libxext6 \
 && rm -rf /var/lib/apt/lists/*

# Copy dependency files first for better caching
COPY Flask Deployed App/requirements.txt ./

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY Flask Deployed App/ ./

# Expose Flask default port 5000
EXPOSE 5000

# Set environment variable to disable buffering for logs
ENV PYTHONUNBUFFERED=1

# Run app using gunicorn process manager
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000", "--workers", "2"]
