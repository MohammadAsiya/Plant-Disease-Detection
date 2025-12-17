# Use official Python slim image
FROM python:3.8-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements first for cache
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all app source code
COPY . /app/

# Expose Flask default port
EXPOSE 5000

# Gunicorn entrypoint as per Procfile
CMD ["gunicorn", "app:app"]
