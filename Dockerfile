# Base image with Python 3.8 slim
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency files first for caching
COPY Flask\ Deployed\ App/requirements.txt ./requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY Flask\ Deployed\ App .

# Expose the port gunicorn will run on
EXPOSE 8000

# Run the Gunicorn server
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8000", "--workers", "4"]
