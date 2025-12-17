# Dockerfile for Plant-Disease-Detection Flask App
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY "Flask Deployed App/requirements.txt" ./requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source code into container
COPY "Flask Deployed App" .

# Expose port 5000 (Flask default)
EXPOSE 5000

# Use gunicorn to run the app according to Procfile
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
