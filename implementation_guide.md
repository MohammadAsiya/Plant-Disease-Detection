# Implementation Guide for Plant-Disease-Detection

## Prerequisites
- Docker installed locally or on your server
- Git installed
- Python 3.8 environment if running locally outside Docker

## Environment Variables
- Currently the app does not require any environment variables for basic functionality

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/MohammadAsiya/Plant-Disease-Detection.git
   cd Plant-Disease-Detection
   ```

2. Place the pre-trained model file `plant_disease_model_1_latest.pt` inside `Flask Deployed App/` directory as required by the app.

3. Using Docker (recommended):
   - Build the Docker image:
     ```bash
     docker build -t plant-disease-detection .
     ```
   - Run the container:
     ```bash
     docker run -p 5000:5000 plant-disease-detection
     ```
   - Access the web app at `http://localhost:5000`

4. Using docker-compose:
   - Start with:
     ```bash
     docker-compose up --build
     ```

5. For local development without Docker:
   - (Optional) Create and activate a Python virtual environment.
   - Install dependencies:
     ```bash
     pip install -r Flask\ Deployed\ App/requirements.txt
     ```
   - Run the Flask app:
     ```bash
     python Flask\ Deployed\ App/app.py
     ```

## CI/CD
- GitHub Actions workflow provided to lint, test, and build Docker image on push to `main` branch or pull requests

## Troubleshooting
- Ensure the pre-trained model file is in the correct path
- Verify Docker is installed and running
- Check port 5000 availability

## Additional Notes
- If you update the deep learning model, update the saved model file name/path accordingly
- You can add more environment variables and config files as needed for production setups

## Links
- Project README: https://github.com/MohammadAsiya/Plant-Disease-Detection/blob/main/README.md
- Deployed app: https://plant-disease-detection-ai.herokuapp.com/
