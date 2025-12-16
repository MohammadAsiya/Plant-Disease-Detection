# Implementation Guide for Plant Disease Detection Flask App

## Prerequisites
- Docker and Docker Compose installed on your local machine or server.
- GitHub account for running CI/CD pipelines.
- Basic knowledge of Python and Flask.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/MohammadAsiya/Plant-Disease-Detection.git
   cd Plant-Disease-Detection/Flask\ Deployed\ App
   ```
2. Ensure model file `plant_disease_model_1_latest.pt`, `disease_info.csv`, `supplement_info.csv` are present in the `Flask Deployed App` directory.

## Running Locally with Docker
1. Build the Docker image:
   ```bash
   docker build -t plant-disease-app .
   ```
2. Run the container:
   ```bash
   docker run -p 5000:5000 plant-disease-app
   ```
3. Access the app in your browser at `http://localhost:5000`

## Using Docker Compose
1. From the repository root, run:
   ```bash
   docker-compose up --build
   ```

## CI/CD Pipeline
- The GitHub Actions workflow is defined in `.github/workflows/cicd.yml`.
- It sets up Python 3.8, installs dependencies, runs linting, and placeholder for building Docker image.

## Environment Variables
- This app does not currently require environment variables.

## Additional Notes
- The app listens on port 5000.
- No external database or services are needed.

## Troubleshooting
- Ensure all required files are in the correct directory.
- Make sure Docker daemon is running.

## References
- [Flask Documentation](https://flask.palletsprojects.com/)
- [PyTorch Documentation](https://pytorch.org/)
