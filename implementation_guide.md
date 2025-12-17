# Implementation Guide for Plant-Disease-Detection

## Prerequisites
- Docker installed (https://docs.docker.com/get-docker/)
- Python 3.8 (for local development without Docker)
- GitHub account for CI/CD workflow

## Required GitHub Secrets (for pushing Docker images)
- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub password or token

## Environment Variables
- `FLASK_ENV`: Set to `development` for local development

## Running Locally Without Docker
1. Clone the repository
2. Navigate to `Flask Deployed App` folder
3. Create and activate a Python virtual environment
4. Install dependencies:
```bash
pip install -r requirements.txt
```
5. Download the pre-trained model `plant_disease_model_1.pt` into the `Flask Deployed App` folder (see README for link)
6. Run the Flask app:
```bash
python app.py
```

## Using Docker

1. Build the Docker image:
```bash
docker build -t plant-disease-detection .
```

2. Run the container:
```bash
docker run -p 5000:5000 plant-disease-detection
```

3. Access the app on `http://localhost:5000`

## Using Docker Compose
1. Run:
```bash
docker-compose up --build
```
2. The app will be available at `http://localhost:5000`

## CI/CD Workflow
- Automatically runs on every push or pull request to `main` branch
- Installs dependencies, lints code, builds Docker image
- Optional Docker push step (disabled by default)

## Database Setup
- No external database required

## Troubleshooting
- Ensure the pre-trained model file is placed correctly
- Use logs to debug issues inside Docker container using:
```bash
docker logs <container_id>
```

## Additional Resources
- Repository README.md
- Flask documentation: https://flask.palletsprojects.com/
- PyTorch documentation: https://pytorch.org/
